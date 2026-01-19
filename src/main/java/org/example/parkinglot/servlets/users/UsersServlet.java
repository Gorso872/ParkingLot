package org.example.parkinglot.servlets.users;

import jakarta.annotation.security.DeclareRoles;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.parkinglot.common.UserDto;
import org.example.parkinglot.ejb.InvoiceBean;
import org.example.parkinglot.ejb.UserBean;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@DeclareRoles({"WRITE_USERS"})
@WebServlet(name = "UsersServlet", value = "/UsersServlet")
@ServletSecurity(

        value = @HttpConstraint(rolesAllowed = "WRITE_USERS"),

        httpMethodConstraints = {
                @HttpMethodConstraint(value = "POST", rolesAllowed = "WRITE_USERS")
        }
)
public class UsersServlet extends HttpServlet {

    @Inject
    UserBean usersBean;
    @Inject
    private InvoiceBean invoiceBean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<UserDto> users = usersBean.findAllUsers();
        request.setAttribute("users", users);

        if(!invoiceBean.getUserIds().isEmpty()) {
            Collection<String> usernames =usersBean.findUsernamesByIds(invoiceBean.getUserIds());
            request.setAttribute("invoices", usernames);

        }


        request.getRequestDispatcher("/WEB-INF/pages/users.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String[] userIdsAsString = request.getParameterValues("userIds");
        if (userIdsAsString != null) {
            List<Long> userIds = new ArrayList<>();
            for (String userIdAsString : userIdsAsString) {
                userIds.add(Long.parseLong(userIdAsString));
            }
            invoiceBean.getUserIds().addAll(userIds);
        }
        response.sendRedirect(request.getContextPath() + "/UsersServlet");
    }
}