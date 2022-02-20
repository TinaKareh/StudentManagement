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
public class InstitutionCourse implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "institution_course_id")
    private Long institutionCourseId;

    @ManyToOne
    @JoinColumn(name = "institution_id")
    private Institution institution;

    @ManyToOne
    @JoinColumn(name = "course_id")
    private Course course;
    
    public InstitutionCourse(){
    
    }
    
    public Institution getInstitution(){
    return institution;
    }
    
    public void setInstitution(Institution institution){
        this.institution = institution;
    }
    
    public Course getCourse(){
        return course;
    }
    
    public void setCourse(Course course){
     this.course=course;
    }

    public Long getInstitutionCourseId() {
        return institutionCourseId;
    }

    public void setInstitutionCourseId(Long institutionCourseId) {
        this.institutionCourseId = institutionCourseId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (institutionCourseId != null ? institutionCourseId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof InstitutionCourse)) {
            return false;
        }
        InstitutionCourse other = (InstitutionCourse) object;
        if ((this.institutionCourseId == null && other.institutionCourseId != null) || (this.institutionCourseId != null && !this.institutionCourseId.equals(other.institutionCourseId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.InstitutionCourse[ id=" + institutionCourseId + " ]";
    }

}
