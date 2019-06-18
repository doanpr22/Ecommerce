/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Cart;
import entity.CategoryEntity;
import entity.OrderDestailsEntity;
import entity.OrdersEntity;
import entity.ProductEntity;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.CategoryService;
import service.ProductService;

/**
 *
 * @author USER
 */
@Controller
@RequestMapping(value = "/cart")
@Scope("session")
public class CartController {

    @Autowired
    ProductService productService;
    @Autowired
    CategoryService categoryService;
    @Autowired
    Cart cart;

    @RequestMapping(method = GET)
    public String displayCart(Model model, HttpServletRequest request) {
        init(model);
        model.addAttribute("cart", cart);
        request.getSession().setAttribute("cart", cart);
        return "/cart";
    }

    public void init(Model model) {

        List<ProductEntity> productlistHot = (List<ProductEntity>) productService.getAllProductByDesc(6);
        model.addAttribute("productlistHot", productlistHot);

        List<ProductEntity> productlist = (List<ProductEntity>) productService.getProductlist();
        model.addAttribute("productlist", productlist);

        List<CategoryEntity> listCategory = categoryService.getListCategory();
        model.addAttribute("listCategory", listCategory);
    }

    @RequestMapping(value = "/add", method = GET)
    public String addItemCart(@RequestParam(name = "id") int idProduct, Model model) {
        //get product by id
        ProductEntity product = productService.getProduct(idProduct);
        //add product in cartEntity
        cart.addItem(product);
        return "redirect:/cart";
    }

    @RequestMapping(value = "/reset", method = GET)
    public String resetCart(@RequestParam(name = "quantity") int quantity, @RequestParam(name = "id") int idProduct, Model model) {

        cart = cart.setQuantityOrderDestails(idProduct, quantity);
        return "redirect:/cart";
    }

    @RequestMapping(value = "/delete", method = GET)
    public String deleteCart(@RequestParam(name = "id") int orderDestailsId, Model model) {
    try {     List<OrderDestailsEntity> orderDestailsEntitys = cart.getOrder().getOrderDestailsList();

        for (OrderDestailsEntity destailsEntity : orderDestailsEntitys) {

            if (destailsEntity.getId() == orderDestailsId) {

                orderDestailsEntitys.remove(destailsEntity);
            }
        }
       
            cart.getOrder().setOrderDestailsList(orderDestailsEntitys);
        } catch (Exception e) {
        }
        return "redirect:/cart";
    }
}
