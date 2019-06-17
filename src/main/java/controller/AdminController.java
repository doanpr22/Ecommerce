/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.CategoryEntity;
import entity.ProducersEntity;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import org.springframework.web.bind.annotation.ResponseBody;
import service.CategoryService;
import service.ProducerService;
import service.ProductDestailsService;
import service.ProductImageService;
import service.ProductService;
import service.UserService;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    @Autowired
    ProductService productService;
    @Autowired
    ServletContext servletContext;
    @Autowired
    CategoryService categoryService;
    @Autowired
    ProducerService producerService;
    @Autowired
    ProductDestailsService productDestailsService;
    @Autowired
    ProductImageService productImageService;
    @Autowired
    UserService userService;

    @RequestMapping(method = GET)
    @ResponseBody
    public String index(Model model, HttpServletRequest request) {
        return "redirect:/";
    }
   
}
