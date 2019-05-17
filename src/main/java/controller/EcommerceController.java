/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.ProfileEntity;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import repository.ProfileRepository;

/**
 *
 * @author USER
 */
@Controller
public class EcommerceController {
    @Autowired ProfileRepository profileRepository;
    
    @RequestMapping(value = "/")
    public String listBook(Model model){
        List<ProfileEntity> profileList=(List<ProfileEntity>) profileRepository.findAll();
        model.addAttribute("profileList",profileList);
        model.addAttribute("profile", profileList.get(0));
       return "/listprofile";
    }
}
