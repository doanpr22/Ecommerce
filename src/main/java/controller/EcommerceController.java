/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.ProfileEntity;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import repository.ProfileRepository;

/**
 *
 * @author USER
 */
@Controller
public class EcommerceController {

    @Autowired
    ProfileRepository profileRepository;

    @RequestMapping(value = "/listprofile")
    public String listBook(Model model) {
        List<ProfileEntity> profileList = (List<ProfileEntity>) profileRepository.findAll();
        model.addAttribute("profileList", profileList);
        return "/listprofile";
    }

    @RequestMapping(value = "/login")
    public String login(Model model) {

        return "/login";
    }

    @RequestMapping(value = "/")
    public String index(Model model) {

        return "/login";
    }
    
}
