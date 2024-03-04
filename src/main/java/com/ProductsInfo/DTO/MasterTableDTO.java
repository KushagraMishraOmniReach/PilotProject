package com.ProductsInfo.DTO;

public class MasterTableDTO {
    public void setTotalRecords(Integer totalRecords) {
        this.totalRecords = totalRecords;
    }

    private Integer totalRecords;

    @Override
    public String toString() {
        return "MasterTableDTO{" +
                "totalRecords='" + totalRecords + '\'' +
                ", productCode='" + productCode + '\'' +
                ", productDescription='" + productDescription + '\'' +
                ", categoryName='" + categoryName + '\'' +
                ", price=" + price +
                ", currency='" + currency + '\'' +
                ", inventoryAvailable=" + inventoryAvailable +
                ", location='" + location + '\'' +
                ", categoryCode=" + categoryCode +
                '}';
    }


    public Integer getTotalRecords() {
        return totalRecords;
    }

    private String productCode;

    private String productDescription;

    private String categoryName;

    private Integer price;

    private String currency;

    private Integer inventoryAvailable;

    private String location;

    private Integer categoryCode;

    public Integer getCategoryCode() {
        return categoryCode;
    }

    public void setCategoryCode(Integer categoryCode) {
        this.categoryCode = categoryCode;
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public Integer getInventoryAvailable() {
        return inventoryAvailable;
    }

    public void setInventoryAvailable(Integer inventoryAvailable) {
        this.inventoryAvailable = inventoryAvailable;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }


}
