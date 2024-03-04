package com.ProductsInfo.Dao;

import com.ProductsInfo.DTO.MasterTableDTO;
import com.ProductsInfo.Entities.ProductsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductsRepository extends JpaRepository<ProductsEntity,String> {



}
