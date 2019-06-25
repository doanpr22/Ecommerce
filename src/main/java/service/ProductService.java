/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import entity.CategoryEntity;
import entity.ProducersEntity;
import entity.ProductDestailsEntity;
import entity.ProductEntity;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;
import repository.ProducersRepository;
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
    CategoryService categoryService;
    @Autowired
    ProductDestailsService productDestailsService;
    @Autowired
    ProducersRepository producersRepository;
    @Autowired
    ProductImageService productImageService;

    public List<ProductEntity> getProductlist() {
        List<ProductEntity> listProduct = (List<ProductEntity>) productRepository.findAll();
        return filterData(listProduct);
    }

    public List<ProductEntity> getAll() {
        List<ProductEntity> listProduct = (List<ProductEntity>) productRepository.findAll();
        return listProduct;
    }

    public ProductEntity getProduct(int id) {
        return productRepository.findById(id);
    }

    public List<ProductEntity> getSearchProduct(String value) {
        List<ProductEntity> listProduct = new ArrayList<ProductEntity>();
        try {
            int id = Integer.parseInt(value.trim());
            listProduct.add(productRepository.findOne(id));
            return listProduct;
        } catch (Exception e) {
        }
        value = "%" + value + "%";

        List<ProductEntity> listProductsearch;
        try {
            listProductsearch = productRepository.findByProductNameLike(value);
            if (listProductsearch != null) {
                listProduct.addAll(listProductsearch);
            }

            listProductsearch = productRepository.findByProductDestailsHedieuhanhLike(value);
            if (listProductsearch != null) {
                listProduct.addAll(listProductsearch);
            }
            listProductsearch = productRepository.findByProductDestailsBonhotrongLike(value);
            if (listProductsearch != null) {
                listProduct.addAll(listProductsearch);
            }
            listProductsearch = productRepository.findByProductDestailsCamerasauLike(value);
            if (listProductsearch != null) {
                listProduct.addAll(listProductsearch);
            }
             listProductsearch = productRepository.findByProductDestailsCameratruocLike(value);
            if (listProductsearch != null) {
                listProduct.addAll(listProductsearch);
            }

            listProductsearch = productRepository.findByCategoryCategoryNameLike(value);
            if (listProductsearch != null) {
                listProduct.addAll(listProductsearch);
            }

            listProductsearch = productRepository.findByProductDestailsCPULike(value);
            if (listProductsearch != null) {
                listProduct.addAll(listProductsearch);
            }
            listProductsearch = productRepository.findByProductDestailsMauLike(value);
            if (listProductsearch != null) {
                listProduct.addAll(listProductsearch);
            }
            

        } catch (Exception e) {
        }
        return filterData(listProduct);
    }

    public List<ProductEntity> getAllProductByDesc(int top) {
        return filterData(productRepository.getAllDESC(top));
    }
    public List<ProductEntity> getAllProductByAsc(int top) {
        return filterData(productRepository.getAllASC(top));
    }

    public List<ProductEntity> filterData(List<ProductEntity> productList) {
        List<ProductEntity> list = new ArrayList<ProductEntity>();
        for (ProductEntity proOld : productList) {
            boolean t = true;
            for (ProductEntity proNew : list) {
                if (proNew.getId() == proOld.getId() || proNew.getProductName().equals(proOld.getProductName())) {
                    t = false;
                }
            }
            if (t) {
                list.add(proOld);
            }
        }
        return list;
    }

    public List<ProductEntity> getSearchProductUnitPrice(ProductEntity product, int top) {
        double price1 = product.getUnitPrice() - 1000000;
        double price2 = product.getUnitPrice() + 1000000;
        return filterData(productRepository.getFindByUnitPrice(price1, price2, top));
    }

    // @ResponseBody
    public ProductEntity saveProduct(ProductEntity product) {

        CategoryEntity category = categoryService.getCategoryName(product.getCategory().getCategoryName());
        if (category == null) {
            category = categoryService.save(new CategoryEntity(product.getCategory().getCategoryName()));
        }

        product.setCategory(category.setCategory());

        ProducersEntity producer = producersRepository.findByProducerName(product.getProducer().getProducerName());
        if (producer == null) {
            producer = producersRepository.save(new ProducersEntity(product.getProducer().getProducerName()));
        }
        product.setProducer(producer.setProducer());

        ProductDestailsEntity productDestails = product.getProductDestails();
        product.setProductDestails(null);
        product = productRepository.save(product);

        productDestails.setId(product.getId());

        productDestailsService.save(productDestails);

        return productRepository.findById(product.getId());
    }

    public boolean delete(int id) {

        try {
            productRepository.delete(id);
            return true;
        } catch (Exception e) {
        }
        return false;
    }

}
