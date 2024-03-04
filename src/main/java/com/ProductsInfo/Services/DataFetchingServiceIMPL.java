package com.ProductsInfo.Services;

import com.ProductsInfo.DTO.MasterTableDTO;
import com.ProductsInfo.DTO.PricesInfoDTO;
import com.ProductsInfo.Dao.CategoriesRepository;
import com.ProductsInfo.Dao.PricesReposistory;
import com.ProductsInfo.Dao.ProductsRepository;
import com.ProductsInfo.Dao.StocksRepository;
import com.ProductsInfo.Entities.ProductsEntity;
import com.ProductsInfo.Entities.StocksEntity;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class DataFetchingServiceIMPL implements DataFetchingService {

    @Autowired
    ProductsRepository productsRepository;
    @Autowired
    StocksRepository stocksRepository;
    @Autowired
    CategoriesRepository categoriesRepository;

    @Autowired
    PricesReposistory pricesReposistory;

    @PersistenceContext
    EntityManager entityManager;

    @Override
    public List<ProductsEntity> getProductsInfo() {
        List<ProductsEntity> returnList = productsRepository.findAll();
        System.out.println(returnList.size());
        return returnList;
    }

    @Override
    public Page getCategories(Integer pageNumber, Integer pageSize, String sortColumn, String sortOrder) {
        Sort sort=null;
        Page page=null;
        System.out.println(sortColumn+" "+sortOrder);
        if(!sortColumn.isEmpty()&&!sortOrder.isEmpty()) {
            if (sortOrder.equalsIgnoreCase("ASC")) {
                sort = Sort.by(sortColumn).ascending();
            } else {
                sort = Sort.by(sortColumn).descending();
            }
            Pageable pageRequest = PageRequest.of(pageNumber, pageSize, sort);
             page = categoriesRepository.findAll(pageRequest);
        }else{
            Pageable pageRequest = PageRequest.of(pageNumber, pageSize);

             page = categoriesRepository.findAll(pageRequest);
        }

        return page;
    }

    @Override
    public Page getStocksInfo(Integer pageNumber,Integer pageSize,String sortColumn,String sortOrder) {
        Sort sort=null;
        Pageable page=null;
        if(!sortColumn.isEmpty()&&!sortOrder.isEmpty()) {
            if (sortOrder.equalsIgnoreCase("ASC")) {
                sort = Sort.by(sortColumn).ascending();
            } else {
                sort = Sort.by(sortColumn).descending();
            }

            page = PageRequest.of(pageNumber, pageSize, sort);
        }else{
            page=PageRequest.of(pageNumber,pageSize);
        }
       System.out.println( page.next().getPageNumber());
       Page p=stocksRepository.findAll(page);
       System.out.println(p.getTotalPages());
        List<StocksEntity> returnList= p.getContent();
        return p;
    }

    @Override
    public PricesInfoDTO getPricesInfo(Integer pageNumber, Integer pageSize, String sortOrder, String sortColumn) {
        try {
            String totalCountQuery="select count(distinct(product_code)) from prices_info";
            Object totalCount=entityManager.createNativeQuery(totalCountQuery,Integer.class).getSingleResult();


            List<String> currencyList = pricesReposistory.getCurrency();
            PricesInfoDTO dto = new PricesInfoDTO();
            dto.setKeySet(currencyList);
            dto.setTotalRecords((Integer)totalCount);
            String queryForFetch = "select distinct p.product_code,";
            String columnPart = "";
            String middlePart = "from prices_info p ";
            String joinPart = "";
            for (int i = 0; i < currencyList.size(); i++) {
                if (i == currencyList.size() - 1) {
                    columnPart += "t" + i + ".price as " + currencyList.get(i) + " ";
                } else {
                    columnPart += "t" + i + ".price as " + currencyList.get(i) + ", ";
                }
                joinPart += "left join prices_info t" + i + " on t" + i + ".currency=" + "'" + currencyList.get(i) + "'" + " and t" + i + ".product_code" + " =p.product_code ";
            }
            String finalQuery = queryForFetch + columnPart + middlePart + joinPart;

            if (!sortColumn.isEmpty()) {
                finalQuery += "order by " + sortColumn;
            }
            if (!sortOrder.isEmpty()) {
                finalQuery += " " + sortOrder;
            }
            if (pageNumber != null && pageSize != null) {
                finalQuery += " LIMIT " + pageNumber*pageSize + ", " + pageSize + " ";
            }

            List<Map> fetchedData = entityManager.createNativeQuery(finalQuery, Map.class).getResultList();
            dto.setRowData(fetchedData);
            System.out.println(fetchedData.size());
            return dto;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    @Override
    public List<MasterTableDTO> fetchMasterTableData(String sortColumn, String sortOrder,Integer pageNumber,Integer pageSize) {

        Integer startIndex=pageNumber*pageSize;

        System.out.println(sortColumn+" "+sortOrder+" "+startIndex+" "+pageSize);



        String query="with temp as (select distinct p.product_code,p.product_description,p.product_category,\n" +
                "c.category_name,s.location,s.inventory_available,ifnull(pi.currency,'Not Available in the location') currency,pi.price\n" +
                "from products_info p inner join stocks_info s on p.product_code=s.product_code\n" +
                "left join currency_info ci on lower(trim(ci.country_name))=lower(trim(s.location))\n" +
                "left join categories_info c on p.product_category=c.category_code\n" +
                "left join prices_info pi on pi.product_code=s.product_code and \n" +
                "ci.currency_code=pi.currency order by "+ sortColumn+" "+ sortOrder+")\n" +
                "select *,(select count(*)  from temp) as totalRecords from temp\n" +
                "  LIMIT "+startIndex+" , "+pageSize;

        System.out.println(query);

        List<Object[]> data=entityManager.createNativeQuery(query).getResultList();

        List<MasterTableDTO> dtoList=data.stream().map(e->{
            MasterTableDTO dto=new MasterTableDTO();
            dto.setProductCode(e[0]==null?"":e[0].toString());
            dto.setProductDescription(e[1]==null?"":e[1].toString());
            dto.setCategoryCode(Integer.parseInt(e[2]==null?"":e[2].toString()));
            dto.setCategoryName(e[3]==null?"":e[3].toString());
            dto.setLocation(e[4]==null?"":e[4].toString());
            dto.setInventoryAvailable(e[5]==null?0:Integer.parseInt(e[5].toString()));
            dto.setCurrency(e[6]==null?"":e[6].toString());
            dto.setPrice(e[7]==null?0:Integer.parseInt(e[7].toString()));
            dto.setTotalRecords(Integer.parseInt(e[8]==null?"":e[8].toString()));
            return dto;
        }).collect(Collectors.toList());
System.out.println(dtoList);
        return dtoList;
    }


}
