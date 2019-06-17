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
        String role = (String) request.getSession().getAttribute("role");

        if (role == null) {
            request.getSession().setAttribute("role","null");
        }
       return "index";
    }

    public void init(Model model) {

        List<ProductEntity> productlist = (List<ProductEntity>) productService.getAllProductByDesc(18);
        model.addAttribute("productlist", productlist);

        List<ProductEntity> productlistHot = (List<ProductEntity>) productService.getAllProductByDesc(6);
        model.addAttribute("productlistHot", productlistHot);

        productlist.listIterator(5);
        List<CategoryEntity> listCategory = categoryService.getListCategory();
        model.addAttribute("listCategory", listCategory);
    }

    @RequestMapping(value = "/product-destails")
    public String productDestails(@RequestParam(name = "productId") int id, Model model) {
        init(model);
        ProductEntity product = productService.getProduct(id);
        model.addAttribute("product", product);
        List<ProductEntity> listProductSearchCategory = productService.getSearchProduct(product.getCategory().getCategoryName());
        model.addAttribute("productlistSameCategory", listProductSearchCategory);

        List<ProductEntity> listProductSearchPrice = productService.getSearchProductUnitPrice(product, 12);

        model.addAttribute("productlistSamePrice", listProductSearchPrice);

        return "/product-destails";
    }

    @RequestMapping(value = "/search")
    public String search(@RequestParam(name = "searchValue") String searchValue, Model model, HttpServletRequest request) {
        init(model);

        request.getSession().setAttribute("searchValue", searchValue);

        List<ProductEntity> listProductSearch = productService.getSearchProduct(searchValue);
        model.addAttribute("productlist", listProductSearch);
        return "/index";
    }

    @RequestMapping(value = "/searchManhinh")
    public String searchSuper(@RequestParam(name = "value1") String value1, Model model, HttpServletRequest request) {
        init(model);

        String searchValue = (String) request.getSession().getAttribute("searchValue");
        if (searchValue == null) {
            return search(value1, model, request);
        } else {
            List<ProductEntity> listProductSearch = productService.getSearchProduct(searchValue);

            model.addAttribute("productlist", listProductSearch);
        }

        return "/index";
    }

    @RequestMapping(value = "registration")
    public String registration(Model model) {
        init(model);
        UsersEntity customer = new UsersEntity();
        model.addAttribute("customer", customer);
        return "/registration";
    }


}
