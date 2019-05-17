/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.time.LocalDate;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author USER
 */
@Entity
@Table(name = "Promotion")
public class PromotionEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private int promotionValue;
    private String description;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate startDay;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate endDay;
    
    @OneToMany(mappedBy = "promotion",cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    private List<PromotionDestailsEntity> promotionDestailsList;

    public PromotionEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPromotionValue() {
        return promotionValue;
    }

    public void setPromotionValue(int promotionValue) {
        this.promotionValue = promotionValue;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDate getStartDay() {
        return startDay;
    }

    public void setStartDay(LocalDate startDay) {
        this.startDay = startDay;
    }

    public LocalDate getEndDay() {
        return endDay;
    }

    public void setEndDay(LocalDate endDay) {
        this.endDay = endDay;
    }

    public List<PromotionDestailsEntity> getPromotionDestailsList() {
        return promotionDestailsList;
    }

    public void setPromotionDestailsList(List<PromotionDestailsEntity> promotionDestailsList) {
        this.promotionDestailsList = promotionDestailsList;
    }
    

}
