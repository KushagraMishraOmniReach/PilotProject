package com.ProductsInfo.Dao;

import com.ProductsInfo.Entities.CategoriesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoriesRepository extends JpaRepository<CategoriesEntity,Integer> {

}
