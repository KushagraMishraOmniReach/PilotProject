package com.ProductsInfo.DTO;

import java.util.Map;

public class PricesRequestDto {

    private String productCode;

    private Map<String,Integer> details;


    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public Map<String, Integer> getDetails() {
        return details;
    }

    public void setDetails(Map<String, Integer> details) {
        this.details = details;
    }
}
