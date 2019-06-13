package redirectLogin;

import java.io.IOException;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import service.UserService;

public class MySimpleUrlAuthenticationSuccessHandler
        implements AuthenticationSuccessHandler {

    protected Log logger = LogFactory.getLog(this.getClass());

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Autowired
    UserService userService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
            HttpServletResponse response, Authentication authentication)
            throws IOException {

        handle(request, response, authentication);
        clearAuthenticationAttributes(request);
    }

    protected void handle(HttpServletRequest request,
            HttpServletResponse response, Authentication authentication)
            throws IOException {

        String targetUrl = determineTargetUrl(authentication, request, response);

        if (response.isCommitted()) {
            logger.debug(
                    "Response has already been committed. Unable to redirect to "
                    + targetUrl);
            return;
        }

        redirectStrategy.sendRedirect(request, response, targetUrl);
    }

    protected String determineTargetUrl(Authentication authentication, HttpServletRequest request,
            HttpServletResponse response) {


        boolean isUser = false;
        boolean isAdmin = false;
        boolean isCustomer = false;
        Collection<? extends GrantedAuthority> authorities
                = authentication.getAuthorities();
        for (GrantedAuthority grantedAuthority : authorities) {
            if (grantedAuthority.getAuthority().equals("ROLE_USER")) {
                request.getSession().setAttribute("role", grantedAuthority.getAuthority());
                isUser = true;
                break;
            } else if (grantedAuthority.getAuthority().equals("ROLE_ADMIN")) {
                request.getSession().setAttribute("role", grantedAuthority.getAuthority());
                isAdmin = true;
                break;
            } else if (grantedAuthority.getAuthority().equals("ROLE_CUSTOMER")) {
                request.getSession().setAttribute("role", grantedAuthority.getAuthority());
                isCustomer = true;
                break;
            }
        }
        request.getSession().setAttribute("username",authentication.getName());
        if (isUser) {
            return "/users";
        } else if (isAdmin) {
            return "/admin";
        } else if (isCustomer) {
            return "/customer";
        } else {
            throw new IllegalStateException();
        }
    }

    protected void clearAuthenticationAttributes(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return;
        }
        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
    }

    public void setRedirectStrategy(RedirectStrategy redirectStrategy) {
        this.redirectStrategy = redirectStrategy;
    }

    protected RedirectStrategy getRedirectStrategy() {
        return redirectStrategy;
    }
}
