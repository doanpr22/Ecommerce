/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import entity.ProductEntity;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.ProductRepository;

/**
 *
 * @author USER
 */
@Service
public class ProductService {
    @Autowired
    ProductRepository productRepository;
    
    public List<ProductEntity> getProductlist(){
        return (List<ProductEntity>) productRepository.findAll();
    }
    public ProductEntity getProduct(int id){
        return productRepository.findById(id);
    }
}
