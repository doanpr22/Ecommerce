/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import entity.ProducersEntity;
import entity.ProductEntity;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.ProducerRepository;

/**
 *
 * @author USER
 */
@Service
public class ProducerService {
    @Autowired
    ProducerRepository producerRepository;
    
    public List<ProducersEntity> getListProducer(){
       
        return (List<ProducersEntity>)producerRepository.findAll();
    }
  
}
