/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.AuthUser;
import Service.CourseFacade;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ViewCourseController", urlPatterns = {"/view/course"})
public class ViewCourseController extends HttpServlet {

    @EJB
    private CourseFacade courseFacade;

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
        try {
            HttpServletRequest httpReq = (HttpServletRequest) request;
            HttpSession session = httpReq.getSession();

            AuthUser user = (AuthUser) session.getAttribute("user");
            request.setAttribute("user", user);

            LOG.log(Level.INFO, String.valueOf(courseFacade.findAll().size()));
            request.setAttribute("courses", courseFacade.findAll());

            getServletContext()
                    .getRequestDispatcher("/WEB-INF/course/view_courses.jsp")
                    .forward(request, response);
        } catch (Exception x) {
        }
    }
    private static final Logger LOG = Logger.getLogger(ViewCourseController.class.getName());

}
