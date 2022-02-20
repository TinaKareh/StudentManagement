/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 *
 * @author Futuristic Ltd
 */
@Entity
public class StudentCourse implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "student_course_id")
    private Long studentCourseId;
    
    @ManyToOne
    @JoinColumn(name = "course_id")
    private Course course;

    public Long getStudentCourseId() {
        return studentCourseId;
    }

    public void setStudentCourseId(Long id) {
        this.studentCourseId = id;
    }
    
     public Course getCourse(){
        return course;
    }
    
    public void setCourse(Course course){
     this.course=course;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (studentCourseId != null ? studentCourseId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof StudentCourse)) {
            return false;
        }
        StudentCourse other = (StudentCourse) object;
        if ((this.studentCourseId == null && other.studentCourseId != null) || (this.studentCourseId != null && !this.studentCourseId.equals(other.studentCourseId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.StudentCourse[ id=" + studentCourseId + " ]";
    }

}
