/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import entity.CreditCard;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.CreditCardRepository;

/**
 *
 * @author USER
 */
@Service
public class CreditCardService {
    @Autowired
    CreditCardRepository cardRepository;
    
    public List<CreditCard> getAllCard(){
        return (List<CreditCard>)cardRepository.findAll();
    }
}
