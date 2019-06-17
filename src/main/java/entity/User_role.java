/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.List;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

/**
 *
 * @author USER
 */
@Entity
@Table(name = "User_Role")
public class User_role {
    @Id
    private String username;
    private String role;
    @OneToMany
    @PrimaryKeyJoinColumn
    private List<UsersEntity> listUser;

    public List<UsersEntity> getListUser() {
        return listUser;
    }

    public void setListUser(List<UsersEntity> listUser) {
        this.listUser = listUser;
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public User_role() {
    }

    public User_role(String username, String role) {
        this.username = username;
        this.role = role;
    }
    
}
