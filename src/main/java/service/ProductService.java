/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import entity.ProductDestailsEntity;
import entity.ProductEntity;
import java.util.ArrayList;
import java.util.List;
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
    @Autowired
    CategoryService  categoryService;
    @Autowired
    ProductDestailsService productDestailsService;
    public List<ProductEntity> getProductlist(){
        return (List<ProductEntity>) productRepository.findAll();
    }
    public ProductEntity getProduct(int id){
        return productRepository.findById(id);
    }
    public List<ProductEntity> getSearchProduct(String value){
        value="%"+value+"%";
        List<ProductEntity> listProduct=new ArrayList<ProductEntity>();
        List<ProductEntity> listProductsearch;
        try{
            listProductsearch=productRepository.findByProductNameLike(value);
            if(listProductsearch!=null){
                listProduct.addAll(listProductsearch);
            }
            
       //     listProductsearch=productRepository.findByproductDestails(value);
            if(listProductsearch!=null){
         //       listProduct.addAll(listProductsearch);
            }
            
         //   listProductsearch=productRepository.findByunitPrice(value);
            if(listProductsearch!=null){
          //      listProduct.addAll(listProductsearch);
            }        
        }catch(Exception e){}
        return listProduct;
    }
    public ProductEntity saveProduct(ProductEntity product){
        
        ProductDestailsEntity productDestails = product.getProductDestails();
        product.setProductDestails(null);
        product=productRepository.save(product);
        productDestails.setId(product.getId());
        
        productDestailsService.save(productDestails);
        
        return productRepository.findById(product.getId());
    }
}
