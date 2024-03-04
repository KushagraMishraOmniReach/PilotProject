package com.ProductsInfo.Services;

import com.ProductsInfo.DTO.MasterTableDTO;
import com.ProductsInfo.DTO.PricesRequestDto;

import java.util.Map;

public interface DataInsertingService {

    public String insertNewCategories(String categoryName,Integer categoryCode);

    public String insertNewPrices(PricesRequestDto pricesInfo);

    public String insertNewProduct(String productCode,String productDescription,Integer categoryCode);


    public String insertNewStocks(String productCode,Integer inventoryAvailabale,String location);

    public String insertMasterData(MasterTableDTO dto);
}
