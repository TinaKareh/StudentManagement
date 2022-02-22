/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Institution;
import Model.Student;
import Service.CourseFacade;
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
import static org.graalvm.compiler.hotspot.amd64.AMD64HotSpotMathIntrinsicOp.IntrinsicOpcode.LOG;

/**
 *
 * @author Futuristic Ltd
 */
@WebServlet(name = "ManagementDashboardController", urlPatterns = {"/dashboard"})
public class ManagementDashboardController extends HttpServlet {

    @EJB
    private CourseFacade courseFacade;
    @EJB
    private InstitutionFacade institutionFacade;
    @EJB
    private StudentFacade studentFacade;
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

        Integer student = studentFacade.count();
        Integer institution = institutionFacade.count();
        Integer course = courseFacade.count();

        List<Institution> inst = (List<Institution>) institutionFacade.getTotalStudents();
        List<Institution> courseGraph = institutionFacade.getTotalCourses();
        LOG.log(Level.INFO, String.valueOf(inst));

        request.setAttribute("courses", course);
        request.setAttribute("institutions", institution);
        request.setAttribute("students", student);
        request.setAttribute("graphs", inst);
        request.setAttribute("totals", courseGraph);
        request.getRequestDispatcher("/WEB-INF/home/dashboard.jsp").forward(request, response);
    }
    private static final Logger LOG = Logger.getLogger(ManagementDashboardController.class.getName());

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
