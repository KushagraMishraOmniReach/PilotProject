package com.ProductsInfo.DTO;

import com.ProductsInfo.Entities.ProductsEntity;

import java.util.List;

public class DataTablesDTO {

    private Integer recordsTotal;
    private Integer recordsFiltered;

    private List<ProductsEntity> entityList;


    public Integer getRecordsTotal() {
        return recordsTotal;
    }

    public void setRecordsTotal(Integer recordsTotal) {
        this.recordsTotal = recordsTotal;
    }

    public Integer getRecordsFiltered() {
        return recordsFiltered;
    }

    public void setRecordsFiltered(Integer recordsFiltered) {
        this.recordsFiltered = recordsFiltered;
    }

    public List<ProductsEntity> getEntityList() {
        return entityList;
    }

    public void setEntityList(List<ProductsEntity> entityList) {
        this.entityList = entityList;
    }
}
