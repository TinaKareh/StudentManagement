/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.AuthUser;
import Model.Institution;
import Model.InstitutionCourse;
import Service.InstitutionCourseFacade;
import Service.InstitutionFacade;
import Service.StudentFacade;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Futuristic Ltd
 */
@WebServlet(name = "ViewStudentsController", urlPatterns = {"/view/students"})
public class ViewStudentsController extends HttpServlet {

    @EJB
    private StudentFacade studentFacade;
    @EJB
    private InstitutionFacade facade;
    @EJB
    private InstitutionCourseFacade institutionFacade;

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

        HttpServletRequest httpReq = (HttpServletRequest) request;
        HttpSession session = httpReq.getSession();

        AuthUser user = (AuthUser) session.getAttribute("user");
        request.setAttribute("user", user);

        LOG.log(Level.INFO, String.valueOf(studentFacade.findAll().size()));
        request.setAttribute("students", studentFacade.findAll());
        request.setAttribute("institutions", facade.findAll());
        getServletContext()
                .getRequestDispatcher("/WEB-INF/student/view_students.jsp")
                .forward(request, response);
    }
    private static final Logger LOG = Logger.getLogger(ViewStudentsController.class.getName());

}
