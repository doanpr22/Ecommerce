/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import entity.ProductImageEntity;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
/**
 *
 * @author USER
 */
@Repository
public interface ProductImageRepository extends CrudRepository<ProductImageEntity, Integer>{
    public List<ProductImageEntity> findByProductId(int id);
}
