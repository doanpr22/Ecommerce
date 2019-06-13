/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import entity.UsersEntity;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.UserRepository;

/**
 *
 * @author USER
 */
@Service
public class UserService {
    @Autowired
     UserRepository userRepository;    
    
    public UsersEntity getUserByUserName(String username){
        return userRepository.getUserByUsername(username);
    }
    public List<UsersEntity> getListUser(){
        return (List<UsersEntity>)userRepository.findAll();
    }
}
