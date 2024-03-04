package com.ProductsInfo.Entities;

import jakarta.persistence.*;

@Entity
@Table(name="STOCKS_INFO")
public class StocksEntity {

    @Column(name="STOCKS_ID")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer stocksId;
    @Column(name="PRODUCT_CODE")
    private String productCode;
    @Column(name="LOCATION")
    private String location;

    @Column(name="INVENTORY_AVAILABLE")
    private Integer inventoryAvailable;


    public Integer getStocksId() {
        return stocksId;
    }

    public void setStocksId(Integer stocksId) {
        this.stocksId = stocksId;
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Integer getInventoryAvailable() {
        return inventoryAvailable;
    }

    public void setInventoryAvailable(Integer inventoryAvailable) {
        this.inventoryAvailable = inventoryAvailable;
    }

    public StocksEntity(Integer stocksId, String productCode, String location, Integer inventoryAvailable) {
       super();
        this.stocksId = stocksId;
        this.productCode = productCode;
        this.location = location;
        this.inventoryAvailable = inventoryAvailable;
    }

    public StocksEntity() {
        super();
    }

    @Override
    public String toString() {
        return "StocksEntity{" +
                "stocksId=" + stocksId +
                ", productCode='" + productCode + '\'' +
                ", location='" + location + '\'' +
                ", inventoryAvailable=" + inventoryAvailable +
                '}';
    }
}
