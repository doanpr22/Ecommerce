/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.CategoryEntity;
import entity.ProductEntity;
import entity.UsersEntity;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.CategoryService;
import service.ProductDestailsService;
import service.ProductService;
import service.UserService;
import utility.GetContextUrl;

/**
 *
 * @author USER
 */
@Controller
@RequestMapping(value = "/")
public class EcommerceController {

    @Autowired
    ProductService productService;
    @Autowired
    ServletContext servletContext;
    @Autowired
    CategoryService categoryService;
    @Autowired
    ProductDestailsService productDestailsService;
    @Autowired
    UserService userService;

    @RequestMapping(method = GET)
    public String index(Model model, HttpServletRequest request) {
        init(model);
        String role = "";
        try {
            String username = (String) request.getSession().getAttribute("username");
            role = (String) request.getSession().getAttribute("role");
        } catch (Exception e) {
        }
        return "index";
    }

    public void init(Model model) {

        List<ProductEntity> productlist = (List<ProductEntity>) productService.getProductlist();
        model.addAttribute("productlist", productlist);
        List<CategoryEntity> listCategory = categoryService.getListCategory();
        model.addAttribute("listCategory", listCategory);
    }

    @RequestMapping(value = "/product-destails")
    public String productDestails(@RequestParam(name = "productId") int id, Model model) {
        ProductEntity product = productService.getProduct(id);
        model.addAttribute("product", product);
        return "/product-destails";
    }

    @RequestMapping(value = "/search")
    public String search(@RequestParam(name = "searchValue") String searchValue, Model model, HttpServletRequest request) {
        init(model);
        List<ProductEntity> listProductSearch = productService.getSearchProduct(searchValue);

        model.addAttribute("productlist", listProductSearch);
        return "/index";
    }

}
