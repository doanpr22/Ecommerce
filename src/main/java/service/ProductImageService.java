/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import entity.ProductEntity;
import entity.ProductImageEntity;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.ProductImageRepository;

/**
 *
 * @author USER
 */
@Service
public class ProductImageService {
    @Autowired
    ProductImageRepository productImageRepository;
    
    public List<ProductImageEntity> saveList(List<String> listUrlImage,ProductEntity product){
        for(String url:listUrlImage){
           productImageRepository.save(new ProductImageEntity(url, product));
        }
        
        return productImageRepository.findByProductId(product.getId());
    }
}
