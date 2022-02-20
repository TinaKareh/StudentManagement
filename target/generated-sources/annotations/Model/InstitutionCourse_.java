package Model;

import Model.Course;
import Model.Institution;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-02-20T15:29:27")
@StaticMetamodel(InstitutionCourse.class)
public class InstitutionCourse_ { 

    public static volatile SingularAttribute<InstitutionCourse, Institution> institution;
    public static volatile SingularAttribute<InstitutionCourse, Long> institutionCourseId;
    public static volatile SingularAttribute<InstitutionCourse, Course> course;

}