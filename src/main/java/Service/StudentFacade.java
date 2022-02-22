/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Service;

import Model.Course;
import Model.Institution;
import Model.InstitutionCourse;
import Model.Student;
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
public class StudentFacade extends AbstractFacade<Student> {

    @PersistenceContext(unitName = "javaBioPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public StudentFacade() {
        super(Student.class);
    }

    public List<Student> institutionStudents(Institution inst) {
        Query query = getEntityManager().createQuery("select a from Student a where a.institution = :inst");
        query.setParameter("inst", inst);

        return (List<Student>) query.getResultList();
    }

    public List<Student> getStudentsByCourse(Course course) {
        Query query = getEntityManager().createQuery("select a from Student a where a.course = :course");
        query.setParameter("course", course);

        return (List<Student>) query.getResultList();
    }
    
   public void deleteStudent(Long studentId){
       Query query = getEntityManager().createQuery("delete from Student where studentId=:studentId");
       query.setParameter("studentId", studentId);
   
   }

}
