/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.CategoryEntity;
import entity.ProducersEntity;
import entity.ProductEntity;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import org.springframework.web.bind.annotation.ResponseBody;
import service.CategoryService;
import service.ProducerService;
import service.ProductDestailsService;
import service.ProductService;
import service.UserService;

/**
 *
 * @author USER
 */
@Controller
@RequestMapping(value = "/customer")
public class CustomerController {
    @Autowired
    ProductService productService;
    @Autowired
    ServletContext servletContext;

    @Autowired
    CategoryService categoryService;
     @Autowired
     UserService userService;
    @Autowired
    ProductDestailsService productDestailsService;
    @Autowired
    ProducerService producerService;

    @RequestMapping(method = GET)
    public String index(Model model, HttpServletRequest request) {
        return "redirect:/";
    }
    
    

}
    

