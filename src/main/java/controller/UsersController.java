/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.CategoryEntity;
import entity.ProducersEntity;
import entity.ProductEntity;
import entity.UsersEntity;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import service.CategoryService;
import service.ProducerService;
import service.ProductDestailsService;
import service.ProductImageService;
import service.ProductService;
import service.UserService;
import utility.UpdateFile;

/**
 *
 * @author USER
 */
@Controller
@RequestMapping(value = "/users")
public class UsersController {

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
    public String index(Model model, HttpServletRequest request) {
        return "redirect:/";
    }

    public void init(Model model) {
        List<CategoryEntity> listCategory = categoryService.getListCategory();
        model.addAttribute("listCategory", listCategory);
        List<ProducersEntity> listProducer = producerService.getListProducer();
        model.addAttribute("listProducer", listProducer);
    }

    @RequestMapping(value = "/newproduct")
    public String addProduct(Model model) {
        init(model);
        ProductEntity product = new ProductEntity();
        model.addAttribute("product", product);
         model.addAttribute("action", "new");
        return "/user/newproduct";
    }
    @RequestMapping(value = "/edit")
    public String edit(Model model,@RequestParam(name = "id") int id) {
        init(model);
        ProductEntity product = productService.getProduct(id);
        model.addAttribute("product", product);
        model.addAttribute("action", "edit");
        return "/user/newproduct";
    }

    /**
     *
     * @param model
     * @param product
     * @param files
     * @return
     */
    @RequestMapping(value = "/save-product")
    public String saveProduct(Model model, ProductEntity product, @RequestParam(name = "files") MultipartFile[] files) {
        List<String> listUrlImage = new ArrayList<String>();
        //save data
        product = productService.saveProduct(product);
        //Create url
        String url = "/image" + File.separator + product.getProducer().getProducerName()
                + File.separator + product.getCategory().getCategoryName()
                + File.separator + product.getProductName()
                + File.separator + product.getProductDestails().getBonhotrong()
                + File.separator + product.getProductDestails().getRam()
                + File.separator + product.getProductDestails().getMau();
        //save image. return urlList
        listUrlImage = UpdateFile.uploadFileList(files, url);

        product.setUrlImage(listUrlImage.get(0));
        product = productService.saveProduct(product);

        listUrlImage.remove(0);
        productImageService.saveList(listUrlImage, product);

        model.addAttribute("product", product);
       return "redirect:/";
    }

}
