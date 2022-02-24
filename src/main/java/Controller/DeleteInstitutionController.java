/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Institution;
import Model.InstitutionCourse;
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
@WebServlet(name = "DeleteInstitutionController", urlPatterns = {"/delete/institution"})
public class DeleteInstitutionController extends HttpServlet {

 @EJB
 private InstitutionFacade institutionFacade;
 @EJB
 private InstitutionCourseFacade facade;

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
      try{
        Institution inst = institutionFacade.find(Long.parseLong(request.getParameter("institutionId")));
       
       List<InstitutionCourse> course = facade.checkInstitutionCourseAssignment(inst);
       if(course == null){
          institutionFacade.remove(inst);
          response.sendRedirect(request.getContextPath() + "/view/institution?deleted=1");
       }else{
           response.sendRedirect(request.getContextPath() + "/view/institution?deleted=0");
       }
       
    }catch (Exception x) {
        }
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
        
    }

  

}
