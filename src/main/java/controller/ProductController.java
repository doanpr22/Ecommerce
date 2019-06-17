/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.CategoryEntity;
import entity.ProductEntity;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
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
@RequestMapping(value = "users/product")
public class ProductController {

    @Autowired
    ProductService productService;

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

    @RequestMapping(method = GET, value = "all")
    public String displayAll(Model model, HttpServletRequest request) {
        init(model);
         String role = (String) request.getSession().getAttribute("role");
            if (role != null && role.equals("ROLE_USER") ||role.equals("ROLE_ADMIN")) {
               return "index";
            } else {
                model.addAttribute("error", "403");
                return "error/403";
            }
    }

    private void init(Model model) {

        List<ProductEntity> productlistHot = (List<ProductEntity>) productService.getAllProductByDesc(5);
        model.addAttribute("productlistHot", productlistHot);

        List<ProductEntity> productlist = (List<ProductEntity>) productService.getAll();
        model.addAttribute("productlist", productlist);

        List<CategoryEntity> listCategory = categoryService.getListCategory();
        model.addAttribute("listCategory", listCategory);
    }

    @RequestMapping(value = "/sendedit")
    public String sendEdit(Model model, @RequestParam(name = "id") int id, HttpServletRequest request) {
        init(model);
        String role = (String) request.getSession().getAttribute("role");
        if (role.equals("ROLE_USER")) {

            ProductEntity product = productService.getProduct(id);

            model.addAttribute("product", product);
            model.addAttribute("action", "edit");
            return "/user/sendEdit";
        } else {
            model.addAttribute("error", "403");
             return "error/403";
        }

    }
     @RequestMapping(value = "/save-product-edit")
    public String saveEdit(Model model, ProductEntity product) {
        List<String> listUrlImage = new ArrayList<String>();
        //String product=productImageService.
        ProductEntity productOld=productService.getProduct(product.getId());
        product.setUrlImage(productOld.getUrlImage());
        product = productService.saveProduct(product);
      //  return product.toString();
        model.addAttribute("product", product);

        return "redirect:/";
    }

    @RequestMapping(value = "/search")
    public String search(@RequestParam(name = "searchValue") String value, Model model, HttpServletRequest request) {
        String role = (String) request.getSession().getAttribute("role");
        if (role.equals("ROLE_USER")) {
            init(model);
            List<ProductEntity> listProductSearch = productService.getSearchProduct(value);
            model.addAttribute("productlist", listProductSearch);
            String action = (String) request.getSession().getAttribute("action");
            if (action.equals("editproduct")) {
                return "/user/edit";
            }
            if (action.equals("deleteproduct")) {
                return "/user/delete";
            }
            return "/user";
        } else {
            model.addAttribute("error", "403");
             return "error/403";
        }

    }

    @RequestMapping(value = "/edit")
    public String edit(Model model, HttpServletRequest request) {
        init(model);
        String role = (String) request.getSession().getAttribute("role");
        if (role.equals("ROLE_USER")) {
            init(model);
            request.getSession().setAttribute("action", "editproduct");
            return "/user/edit";
        } else {
            model.addAttribute("error", "403");
            return "error/403";
        }

    }

    @RequestMapping(value = "/delete")
    public String delete(Model model, HttpServletRequest request) {
        init(model);
        String role = (String) request.getSession().getAttribute("role");
        if (role.equals("ROLE_USER")) {
            init(model);
            request.getSession().setAttribute("action", "deleteproduct");
            return "/user/delete";
        } else {
            model.addAttribute("error", "403");
             return "error/403";
        }

    }

    @RequestMapping(value = "/savedelete")
    public String savedelete(Model model, @RequestParam(name = "id") int id, HttpServletRequest request) {
        String role = (String) request.getSession().getAttribute("role");
        init(model);
        if (role.equals("ROLE_USER")) {
            if(productService.delete(id)){
                 return "redirect:/users/product/delete?delete=success";
            }
            else{
                 return "redirect:/users/product/delete?delete=error";
            }
            
        } else {
            model.addAttribute("error", "403");
             return "error/403";
        }

    }

    //////////////////add product
    @RequestMapping(value = "/new")
    public String addProduct(Model model, HttpServletRequest request) {
        String role = (String) request.getSession().getAttribute("role");
        init(model);
        if (role.equals("ROLE_USER")) {
            ProductEntity product = new ProductEntity();
            model.addAttribute("product", product);
            model.addAttribute("action", "new");
            return "/user/newproduct";
        } else {
            model.addAttribute("error", "403");
             return "error/403";
        }

    }

    @RequestMapping(value = "/save-product")
    public String saveProduct(Model model, ProductEntity product, @RequestParam(name = "files") MultipartFile[] files) {
        List<String> listUrlImage = new ArrayList<String>();

        product = productService.saveProduct(product);
       // return product.toString();
        
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
