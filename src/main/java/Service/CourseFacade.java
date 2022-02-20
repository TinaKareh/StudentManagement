/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Service;

import Model.Course;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Futuristic Ltd
 */
@Stateless
public class CourseFacade extends AbstractFacade<Course> {

    @PersistenceContext(unitName = "javaBioPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CourseFacade() {
        super(Course.class);
    }
    public Course addCourse(String courseName) {

        String jpql = "SELECT a FROM Course a WHERE a.courseName = :course";
        Query query = getEntityManager().createQuery(jpql);
        query.setParameter("course", courseName);

        try {
            return (Course) query.getSingleResult();
        } catch (Exception x) {
            return null;
        }
    }
}
