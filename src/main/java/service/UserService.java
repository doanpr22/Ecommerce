/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import entity.User_role;
import entity.UsersEntity;
import java.time.LocalDate;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.UserRepository;
import repository.User_RoleRepository;

/**
 *
 * @author USER
 */
@Service
public class UserService {

    @Autowired
    UserRepository userRepository;
    @Autowired
    User_RoleRepository roleRepository;

    public UsersEntity getUserByUserName(String username) {
        return userRepository.findByUsername(username);
    }

    public List<UsersEntity> getListUser() {
        return (List<UsersEntity>) userRepository.findAll();
    }

    public UsersEntity saveCustomer(UsersEntity customer) {

        //UsersEntity cus=userRepository.save(customer);
        User_role role = new User_role(customer.getUsername(), "ROLE_CUSTOMER");
        customer.setRole(role);
        customer.setEnabled(1);
       // customer.setCreateday(LocalDate.now());
        // roleRepository.save(role);
        return userRepository.save(customer);

    }
}
