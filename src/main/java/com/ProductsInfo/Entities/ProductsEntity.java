package com.ProductsInfo.Entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "PRODUCTS_INFO")
public class ProductsEntity {
@Column(name="PRODUCT_CODE")
@Id
    private String productCode;
@Column(name = "PRODUCT_DESCRIPTION")
    private String productDescription;
    @Column(name="PRODUCT_CATEGORY")
    private Integer category;

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

    public Integer getCategory() {
        return category;
    }

    public void setCategory(Integer category) {
        this.category = category;
    }

    public ProductsEntity(String productCode, String productDescription, Integer category) {
        super();
        this.productCode = productCode;
        this.productDescription = productDescription;
        this.category = category;
    }

    public ProductsEntity() {
        super();
    }
}
