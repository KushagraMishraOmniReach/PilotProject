package com.ProductsInfo.Services;

import com.ProductsInfo.DTO.MasterTableDTO;
import com.ProductsInfo.DTO.PricesRequestDto;
import com.ProductsInfo.Dao.CategoriesRepository;
import com.ProductsInfo.Dao.PricesReposistory;
import com.ProductsInfo.Dao.ProductsRepository;
import com.ProductsInfo.Dao.StocksRepository;
import com.ProductsInfo.Entities.CategoriesEntity;
import com.ProductsInfo.Entities.PricesEntity;
import com.ProductsInfo.Entities.ProductsEntity;
import com.ProductsInfo.Entities.StocksEntity;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class DataInsertingServiceIMPL implements DataInsertingService{

    @Autowired
    CategoriesRepository categoriesRepository;

    @Autowired
    ProductsRepository productsRepository;

    @Autowired
    StocksRepository stocksRepository;

    @Autowired
    PricesReposistory pricesReposistory;
    @Override
    @Transactional
    public String insertNewCategories(String categoryName, Integer categoryCode) {
try {
    CategoriesEntity entity = new CategoriesEntity(categoryCode, categoryName);
    categoriesRepository.save(entity);
    return "SUCCESS";
}catch (Exception e){
    System.out.println((e.getMessage()));
    return "FAILED";
}
    }

    @Override
    @Transactional
    public String insertNewPrices(PricesRequestDto dto) {

        System.out.println(dto);
        Map<String,Integer> pricesInfo=dto.getDetails();
        try {
List<PricesEntity> entityList=new ArrayList<>();
String productCode=dto.getProductCode();
            Set<Map.Entry<String,Integer>> details=dto.getDetails().entrySet();
            entityList=details.stream().map(e->{
                PricesEntity entity=new PricesEntity();
                entity.setProductCode(productCode);
                entity.setCurrency(e.getKey());
                entity.setPrice(e.getValue());
                return entity;
            }).collect(Collectors.toList());
                pricesReposistory.saveAll(entityList);
            return "SUCCESS";
        }catch (Exception e){
            System.out.println(e.getMessage());
            return "FAILED";
        }
    }

    @Override
    @Transactional
    public String insertNewProduct(String productCode, String productDescription, Integer categoryCode) {
        try {
            ProductsEntity entity = new ProductsEntity();
            entity.setCategory(categoryCode);
            entity.setProductCode(productCode);
            entity.setProductDescription(productDescription);
            productsRepository.save(entity);
            return "SUCCESS";
        }catch (Exception e) {
            System.out.println(e.getMessage());
            return "FAILED";
        }
    }

    @Override
    @Transactional
    public String insertNewStocks(String productCode, Integer inventoryAvailabale, String location) {

        try{
            StocksEntity entity=new StocksEntity();
            entity.setProductCode(productCode);
            entity.setLocation(location);
            entity.setInventoryAvailable(inventoryAvailabale);
            stocksRepository.save(entity);
            return "SUCCESS";
        }catch (Exception e) {
            System.out.println(e.getMessage());
            return "FAILED";
        }
    }

    @Override
    @Transactional
    public String insertMasterData(MasterTableDTO dto) {

        try {
            ProductsEntity productsEntity = new ProductsEntity();
            productsEntity.setProductCode(dto.getProductCode());
            productsEntity.setProductDescription(dto.getProductDescription());
            productsEntity.setCategory(dto.getCategoryCode());
            StocksEntity stocksEntity = new StocksEntity();
            stocksEntity.setLocation(dto.getLocation());
            stocksEntity.setInventoryAvailable(dto.getInventoryAvailable());
            stocksEntity.setProductCode(dto.getProductCode());
            PricesEntity pricesEntity = new PricesEntity();
            pricesEntity.setPrice(dto.getPrice());
            pricesEntity.setCurrency(dto.getCurrency());
            pricesEntity.setProductCode(dto.getProductCode());
            productsRepository.save(productsEntity);
            stocksRepository.save(stocksEntity);
            pricesReposistory.save(pricesEntity);
            return "SUCCESS";
        }catch (Exception e){
            System.out.println(e.getMessage());
            return "FAILED";
        }
    }
}
