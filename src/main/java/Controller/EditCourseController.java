/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.AuthUser;
import Model.Course;
import Service.CourseFacade;
import Service.InstitutionCourseFacade;
import Service.InstitutionFacade;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "EditCourseController", urlPatterns = {"/edit/course"})
public class EditCourseController extends HttpServlet {

    @EJB
    private CourseFacade courseFacade;
    @EJB
    private InstitutionFacade institutionFacade;
    @EJB
    private InstitutionCourseFacade facade;

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
        
       Course course = courseFacade.find(Long.parseLong(request.getParameter("institutionId")));
        request.setAttribute("course", course);
        getServletContext()
                .getRequestDispatcher("/WEB-INF/course/edit_course.jsp")
                .forward(request, response);
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
         Course course = new Course();
        String co = request.getParameter("course");
        course =courseFacade.addCourse(co);
        
        if(course == null){
            Course newCourse = courseFacade.find(Long.parseLong(request.getParameter("instId")));
            newCourse.setCourseName(co);
            courseFacade.edit(newCourse);
            response.sendRedirect(request.getContextPath() + "/view/course/?edited=1");
        }else{
            response.sendRedirect(request.getContextPath() + "/view/course?edited=0");
        }
    }


}
