package Model;

import Model.Course;
import Model.Institution;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-02-20T09:13:38")
@StaticMetamodel(Student.class)
public class Student_ { 

    public static volatile SingularAttribute<Student, Long> studentId;
    public static volatile SingularAttribute<Student, String> firstName;
    public static volatile SingularAttribute<Student, String> studentIdentification;
    public static volatile SingularAttribute<Student, Institution> institution;
    public static volatile SingularAttribute<Student, String> surname;
    public static volatile SingularAttribute<Student, Course> course;
    public static volatile SingularAttribute<Student, String> middleName;

}