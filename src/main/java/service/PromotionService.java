/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import entity.PromotionDestailsEntity;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.PromotionDestailsRepositry;
import repository.PromotionRepository;

/**
 *
 * @author USER
 */
@Service
public class PromotionService {
    @Autowired
    PromotionRepository promotionRepository;
    @Autowired
    PromotionDestailsRepositry promotionDestailsRepositry;
    public List<PromotionDestailsEntity> getListpromotion(int idPromotion){
      //  PromotionEntity promotion=promotionRepository.findOne(idPromotion);
      
        return promotionRepository.findOne(idPromotion).getPromotionDestailsList();
    }
}
