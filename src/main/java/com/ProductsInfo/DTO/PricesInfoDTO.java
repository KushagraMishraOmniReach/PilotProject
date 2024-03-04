package com.ProductsInfo.DTO;

import java.util.List;
import java.util.Map;

public class PricesInfoDTO {

    private Integer totalRecords;

    private List<String> keySet;

    private List<Map> rowData;


    public Integer getTotalRecords() {
        return totalRecords;
    }

    public void setTotalRecords(Integer totalRecords) {
        this.totalRecords = totalRecords;
    }

    public List<String> getKeySet() {
        return keySet;
    }

    public void setKeySet(List<String> keySet) {
        this.keySet = keySet;
    }

    public List<Map> getRowData() {
        return rowData;
    }

    public void setRowData(List<Map> rowData) {
        this.rowData = rowData;
    }
}
