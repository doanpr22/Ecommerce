/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import entity.User_role;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author USER
 */
@Repository
public interface User_RoleRepository extends CrudRepository<User_role, Integer>{
    
}
