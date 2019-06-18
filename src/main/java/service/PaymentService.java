/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import entity.PaymentEntity;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.PaymenRepository;

/**
 *
 * @author USER
 */
@Service
public class PaymentService {
    @Autowired PaymenRepository paymenRepository;
    
    public List<PaymentEntity> getListPayment(){
        return (List<PaymentEntity>) paymenRepository.findAll();
    }
    public PaymentEntity save(PaymentEntity payment){
        return paymenRepository.save(payment);
    }
    
    
}
