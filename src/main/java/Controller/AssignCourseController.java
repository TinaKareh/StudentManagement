/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.AuthUser;
import Model.Course;
import Model.Institution;
import Model.InstitutionCourse;
import Service.CourseFacade;
import Service.InstitutionCourseFacade;
import Service.InstitutionFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "AssignCourseController", urlPatterns = {"/assign/course"})
public class AssignCourseController extends HttpServlet {

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

        Institution institution = institutionFacade.find(Long.parseLong(request.getParameter("institutionId")));
        List courses = courseFacade.findAll();
        List<InstitutionCourse> inst = facade.getCoursesByInstitution(institution);
        request.setAttribute("institution", institution);
        request.setAttribute("courses", courses);
        request.setAttribute("addedCourses", inst);
        getServletContext()
                .getRequestDispatcher("/WEB-INF/institution/assign_courses.jsp")
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
        InstitutionCourse institution = new InstitutionCourse();
        String id = request.getParameter("institutionId");
        Institution task = institutionFacade.find(Long.parseLong(request.getParameter("institutionId")));
        Course course = courseFacade.find(Long.parseLong(request.getParameter("course")));
        institution = facade.addCourse(task, course);
        if (institution == null) {
            InstitutionCourse inst = new InstitutionCourse();
            inst.setInstitution(task);
            inst.setCourse(course);
            facade.create(inst);
            try {
                response.sendRedirect(request.getContextPath() + "/assign/course?success=1&institutionId=" + id);
            } catch (Exception x) {
            }
        } else {
            try {
                response.sendRedirect(request.getContextPath() + "/assign/course?success=1&institutionId=" + id);
            } catch (Exception x) {
            }
        }

    }

}
