/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import entity.ProductDestailsEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.ProductDestailsRepository;

/**
 *
 * @author USER
 */
@Service
public class ProductDestailsService {
    @Autowired
    ProductDestailsRepository productDestailsRepository;
    
    public ProductDestailsEntity save(ProductDestailsEntity productDestails){
        return productDestailsRepository.save(productDestails);
    }
}
