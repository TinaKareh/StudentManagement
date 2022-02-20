/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Institution;
import Service.InstitutionFacade;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Futuristic Ltd
 */
@WebServlet(name = "DeleteInstitutionController", urlPatterns = {"/delete/institution"})
public class DeleteInstitutionController extends HttpServlet {

    @EJB
    private InstitutionFacade institutionFacade;


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
        
        Institution institution = institutionFacade.find(Long.parseLong(request.getParameter("institutionId")));
        institutionFacade.remove(institution);
        getServletContext()
                .getRequestDispatcher("/WEB-INF/institution/view_institutions.jsp")
                .forward(request, response);
    }

}
