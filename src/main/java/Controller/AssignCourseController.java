/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

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
        List courses = courseFacade.findAll();
        Institution institution = institutionFacade.find(Long.parseLong(request.getParameter("institutionId")));
        List<InstitutionCourse> inst = facade.institutionCourses(institution);
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
        InstitutionCourse inst = new InstitutionCourse();
        Institution task = institutionFacade.find(Long.parseLong(request.getParameter("instId")));
        inst = (InstitutionCourse) facade.addCourse(task);
        if (inst == null) {
            for (String val : request.getParameterValues("course")) {
                InstitutionCourse course = new InstitutionCourse();
                course.setInstitution(task);
                course.setCourse(courseFacade.find(Long.parseLong(val.replace("", ""))));
                facade.create(course);

            }
        } else {
        }

    }

}