/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import entity.CategoryEntity;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.CategoryRepository;

/**
 *
 * @author USER
 */
@Service
public class CategoryService {
    @Autowired
    CategoryRepository categoryRepository;
    
    public List<CategoryEntity> getListCategory(){
        return (List<CategoryEntity> )categoryRepository.findAll();
    }
    public CategoryEntity save(CategoryEntity categoryEntity){
        return categoryRepository.save(categoryEntity);
    }
    public CategoryEntity getCategory(int id){
        return categoryRepository.findOne(id);
    }
    public CategoryEntity getCategoryName(String name){
        return categoryRepository.findByCategoryName(name);
    }
}
