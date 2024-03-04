package com.ProductsInfo.Dao;

import com.ProductsInfo.Entities.StocksEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StocksRepository extends JpaRepository<StocksEntity,Integer> {
}
