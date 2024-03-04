package com.ProductsInfo.Services;

import com.ProductsInfo.DTO.MasterTableDTO;
import com.ProductsInfo.DTO.PricesInfoDTO;
import com.ProductsInfo.Entities.ProductsEntity;
import org.springframework.data.domain.Page;

import java.util.List;

public interface DataFetchingService {
    public List<ProductsEntity> getProductsInfo();

    public Page getCategories(Integer pageNumber, Integer pageSize, String sortColumn, String sortOrder);

    public Page getStocksInfo(Integer pageNumber, Integer pageSize, String sortColumn, String sortOrder);

    public PricesInfoDTO getPricesInfo(Integer pageSize, Integer pageNumber, String sortOrder, String sortColumn);


    public List<MasterTableDTO> fetchMasterTableData(String sortColumn,String sortOrder,Integer pageNumber,Integer pageSize);

}
