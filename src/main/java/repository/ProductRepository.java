/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import entity.ProductEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author USER
 */
@Repository
public interface ProductRepository extends CrudRepository<ProductEntity, Integer>{
    public ProductEntity findById(int id);
    public List<ProductEntity> findByProductNameLike(String value);
    @Query(value = "select *from Product where unitprice>? and unitprice<? ORDER BY unitprice DESC LIMIT ?;",nativeQuery = true)
   public List<ProductEntity> getFindByUnitPrice(double price1,double price2,int top);
   public List<ProductEntity> findByCategoryId(int id);
   public List<ProductEntity> findByCategoryCategoryNameLike(String value);
   public List<ProductEntity> findByProductDestailsMauLike(String value);
   public List<ProductEntity> findByProductDestailsManhinhLike(String value);
   public List<ProductEntity> findByProductDestailsRamLike(String value);
   public List<ProductEntity> findByProductDestailsBonhotrongLike(String value);
   public List<ProductEntity> findByProductDestailsCPULike(String value);
   public List<ProductEntity> findByProductDestailsHedieuhanhLike(String value);
   public List<ProductEntity> findByProductDestailsCameratruocLike(String value);
   public List<ProductEntity> findByProductDestailsCamerasauLike(String value);
   public List<ProductEntity> findByProductDestailsDophangiaiLike(String value);

     @Query(value = "select *from Product ORDER BY unitprice DESC LIMIT ?;",nativeQuery = true)
   public List<ProductEntity> getAllDESC(int top);
}
