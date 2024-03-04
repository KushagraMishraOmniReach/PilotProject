package com.ProductsInfo.Dao;

import com.ProductsInfo.Entities.PricesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface PricesReposistory extends JpaRepository<PricesEntity,Integer> {
@Query(value = "select distinct currency from prices_info",nativeQuery = true)
    public List<String> getCurrency();

   }
