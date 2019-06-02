/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.ProductEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author USER
 */
@Controller
@RequestMapping(value = "/users")
public class UsersController {
       @RequestMapping(value = "/index")
    public String index(Model model){
        
        return "/user/index-user";
    }
    @RequestMapping(value = "/newproduct")
    public String addProduct(Model model){
        model.addAttribute("product", new ProductEntity());
        return "/user/newproduct";
    }
    @RequestMapping(value = "/save-product")
    public String saveProduct(Model model,@RequestParam(name = "title") String productName,@RequestParam(name = "image") String image){
        
        return index(model);
    }

    }