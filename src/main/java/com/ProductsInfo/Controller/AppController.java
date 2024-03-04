package com.ProductsInfo.Controller;

import com.ProductsInfo.DTO.DataTablesDTO;
import com.ProductsInfo.DTO.MasterTableDTO;
import com.ProductsInfo.DTO.PricesInfoDTO;
import com.ProductsInfo.DTO.PricesRequestDto;
import com.ProductsInfo.Entities.ProductsEntity;
import com.ProductsInfo.Services.DataFetchingServiceIMPL;
import com.ProductsInfo.Services.DataInsertingServiceIMPL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class AppController {
    @Autowired
    DataFetchingServiceIMPL dataFetchingServiceIMPL;

    @Autowired
    DataInsertingServiceIMPL dataInsertingServiceIMPL;

    @GetMapping(value = "/Hello")
    public String helloWorld() {
        return "Home";
    }


    @RequestMapping(value = "/getProductsInfo", produces = "application/json", method = RequestMethod.GET)
    public @ResponseBody DataTablesDTO getProductsInfo() {
        try {
            List<ProductsEntity> returnList = dataFetchingServiceIMPL.getProductsInfo();

            DataTablesDTO rn = new DataTablesDTO();
            rn.setEntityList(returnList);
            rn.setRecordsFiltered(returnList.size());
            rn.setRecordsTotal(returnList.size());
            return rn;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    @GetMapping("/getStocksInfo")
    public @ResponseBody Page getStocksInfo(@RequestParam("pageNumber") Integer pageNumber,
                                            @RequestParam("pageSize") Integer pageSize, @RequestParam("sortOrder") String sortOrder,
                                            @RequestParam("sortColumn") String sortColumn) {
        return dataFetchingServiceIMPL.getStocksInfo(pageNumber, pageSize,sortColumn,sortOrder);
    }


    @GetMapping("/getCategoriesInfo")
    public @ResponseBody Page getCategories(@RequestParam("pageNumber") Integer pageNumber,
                                            @RequestParam("pageSize") Integer pageSize, @RequestParam( value = "sortOrder") String sortOrder,
                                            @RequestParam( value = "sortColumn") String sortColumn) {

        return dataFetchingServiceIMPL.getCategories(pageNumber,pageSize,sortColumn,sortOrder);
    }

    @GetMapping(value = "/newPricesMethod", produces = "application/json")
    public @ResponseBody PricesInfoDTO getNewPrices(@RequestParam("pageNumber") Integer pageNumber,
                                                    @RequestParam("pageSize") Integer pageSize, @RequestParam("sortOrder") String sortOrder,
                                                    @RequestParam("sortColumn") String sortColumn) {
        return dataFetchingServiceIMPL.getPricesInfo(
                pageNumber, pageSize, sortOrder, sortColumn
        );

    }

    @PostMapping("/insertNewStocks")
    public  @ResponseBody  String insertNewStocks(@RequestParam("productCode")String productCode,
                                  @RequestParam("location")String location,@RequestParam("inventoryAvailable")Integer inventoryAvailable){


        return dataInsertingServiceIMPL.insertNewStocks(productCode,inventoryAvailable,location);
    }

    @PostMapping("/insertNewCategories")
    public @ResponseBody  String insertNewCategories(@RequestParam("categoryCode")Integer categoryCode,@RequestParam("categoryName")
                                      String categoryName){

        System.out.println("method is called"+categoryName+" "+categoryCode);
        return dataInsertingServiceIMPL.insertNewCategories(categoryName,categoryCode);
    }

    @PostMapping(value = "/insertNewPrices")
    public @ResponseBody  String insertNewPrices(@RequestBody PricesRequestDto pricesInfo){
System.out.println(pricesInfo);
        return dataInsertingServiceIMPL.insertNewPrices(pricesInfo);
    }

    @GetMapping("/fetchMasterTable")
    public @ResponseBody List<MasterTableDTO> fetchMasterTable(@RequestParam("pageNumber") Integer pageNumber,
                                                         @RequestParam("pageSize") Integer pageSize, @RequestParam("sortOrder") String sortOrder,
                                                         @RequestParam("sortColumn") String sortColumn){

        return dataFetchingServiceIMPL.fetchMasterTableData(sortColumn,sortOrder,pageNumber,pageSize);
    }

    @PostMapping("/insertMasterData")
    public @ResponseBody String insertMasterData(@RequestBody MasterTableDTO dto){
        return dataInsertingServiceIMPL.insertMasterData(dto);
    }
}
