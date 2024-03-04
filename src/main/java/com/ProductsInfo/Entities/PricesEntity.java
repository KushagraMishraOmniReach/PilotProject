package com.ProductsInfo.Entities;

import jakarta.persistence.*;

@Entity
@Table(name="PRICES_INFO")
public class PricesEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer PricesId;
@Column(name="PRODUCT_CODE")
    private String productCode;

    private Integer price;


    private String currency;

    public Integer getPricesId() {
        return PricesId;
    }

    public void setPricesId(Integer pricesId) {
        PricesId = pricesId;
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
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

    public PricesEntity(Integer pricesId, String productCode, Integer price, String currency) {
        super();
        PricesId = pricesId;
        this.productCode = productCode;
        this.price = price;
        this.currency = currency;
    }

    @Override
    public String toString() {
        return "PricesEntity{" +
                "PricesId=" + PricesId +
                ", productCode='" + productCode + '\'' +
                ", price=" + price +
                ", currency='" + currency + '\'' +
                '}';
    }

    public PricesEntity() {
        super();
    }
}
