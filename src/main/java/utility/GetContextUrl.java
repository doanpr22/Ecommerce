/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author USER
 */
public class GetContextUrl {

    public static String getContextUrl(HttpServletRequest request) {
        try {
            String username = (String) request.getSession().getAttribute("username");
            String role = (String) request.getSession().getAttribute("role");
            // UsersEntity user=userService.getUserByUserName(username);
            if (username != null) {
                // return user.toString();
                if (role.equals("ROLE_USER")) {
                    return "redirect:/users";
                }
                if (role.equals("ROLE_ADMIN")) {
                    return "redirect:/admin";
                }
                if (role.equals("ROLE_CUSTOMER")) {
                    return "redirect:/customer";
                }
            }

        } catch (Exception e) {
            request.getSession().setAttribute("username", null);
        }

        return null;
    }
}
