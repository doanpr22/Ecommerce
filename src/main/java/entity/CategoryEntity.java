/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author USER
 */
@Entity
@Table(name = "Category")
public class CategoryEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String categoryName;
    private String description;

    @OneToMany(mappedBy = "category")
    private List<ProductEntity> productlist;

    public CategoryEntity() {
    }

    public CategoryEntity(int id, String categoryName, String description) {
        this.id = id;
        this.categoryName = categoryName;
        this.description = description;
    }

    public CategoryEntity(String categoryName, String description) {
        this.categoryName = categoryName;
        this.description = description;
    }

    public CategoryEntity(int id, String categoryName, String description, List<ProductEntity> productlist) {
        this.id = id;
        this.categoryName = categoryName;
        this.description = description;
        this.productlist = productlist;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<ProductEntity> getProductlist() {
        return productlist;
    }

    public void setProductlist(List<ProductEntity> productlist) {
        this.productlist = productlist;
    }

}
