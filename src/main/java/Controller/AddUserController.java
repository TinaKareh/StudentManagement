/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.AuthUser;
import Service.AuthUserFacade;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Futuristic Ltd
 */
@WebServlet(name = "AddUserController", urlPatterns = {"/add/user"})
public class AddUserController extends HttpServlet {

    @EJB
    AuthUserFacade authFacade;

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/auth/add_user.jsp").forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AuthUser authUser = new AuthUser();
        authUser.setFirstName(request.getParameter("fname"));
        authUser.setLastName(request.getParameter("lname"));
        authUser.setUserName(request.getParameter("uname"));
        authUser.setEmailAddress(request.getParameter("email"));
        authUser.setPhoneNumber(request.getParameter("phone"));
        authUser.setPassword(request.getParameter("password"));
        authUser.setConfirmPass(request.getParameter("confirmPass"));
        authFacade.create(authUser);

       // LOG.log(Level.INFO, authUser.toString());
        response.sendRedirect(request.getContextPath());
    }

    private static final Logger LOG = Logger.getLogger(AddUserController.class.getName());

}
