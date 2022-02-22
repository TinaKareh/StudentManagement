/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Service;

import Model.Course;
import Model.Institution;
import Model.InstitutionCourse;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Futuristic Ltd
 */
@Stateless
public class InstitutionCourseFacade extends AbstractFacade<InstitutionCourse> {

    @PersistenceContext(unitName = "javaBioPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public InstitutionCourseFacade() {
        super(InstitutionCourse.class);
    }

    public List<InstitutionCourse> getCoursesByInstitution(Institution inst) {
        Query query = getEntityManager().createQuery("select a from InstitutionCourse a where a.institution = :inst");
        query.setParameter("inst", inst);

        return (List<InstitutionCourse>) query.getResultList();
    }

    public InstitutionCourse addCourse(Institution inst, Course course) {

        String jpql = "SELECT a FROM InstitutionCourse a WHERE a.institution = :inst and a.course = :course";
        Query query = getEntityManager().createQuery(jpql);
        query.setParameter("inst", inst);
        query.setParameter("course", course);

        try {
            return (InstitutionCourse) query.getSingleResult();
        } catch (Exception x) {
            return null;
        }
    }

    public List<InstitutionCourse> getInstitutionsByCourse(Course course) {
        Query query = getEntityManager().createQuery("select a from InstitutionCourse a where a.course = :course");
        query.setParameter("course", course);

        return (List<InstitutionCourse>) query.getResultList();
    }

    public List<InstitutionCourse> checkInstitutionCourseAssignment(Institution institution) {
        String jpql = "SELECT a FROM InstitutionCourse a WHERE a.institution = :inst";
        Query query = getEntityManager().createQuery(jpql);
        query.setParameter("inst", institution);
        
        try {
            return (List<InstitutionCourse>) query.getResultList();
        } catch (Exception x) {
            return null;
        }
    }

}
