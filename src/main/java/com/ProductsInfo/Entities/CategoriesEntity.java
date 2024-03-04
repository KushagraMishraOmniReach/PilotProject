package com.ProductsInfo.Entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="CATEGORIES_INFO")
public class CategoriesEntity {
@Column(name="CATEGORY_CODE")
@Id
    private Integer categoryCode;
@Column(name="CATEGORY_NAME")
    private String categoryName;

    public Integer getCategoryCode() {
        return categoryCode;
    }

    public void setCategoryCode(Integer categoryCode) {
        this.categoryCode = categoryCode;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public CategoriesEntity(Integer categoryCode, String categoryName) {
        super();
        this.categoryCode = categoryCode;
        this.categoryName = categoryName;
    }

    public CategoriesEntity() {
        super();
    }


}
