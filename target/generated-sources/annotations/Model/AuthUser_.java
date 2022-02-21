package Model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-02-21T09:02:09")
@StaticMetamodel(AuthUser.class)
public class AuthUser_ { 

    public static volatile SingularAttribute<AuthUser, String> firstName;
    public static volatile SingularAttribute<AuthUser, String> lastName;
    public static volatile SingularAttribute<AuthUser, String> emailAddress;
    public static volatile SingularAttribute<AuthUser, String> password;
    public static volatile SingularAttribute<AuthUser, String> phoneNumber;
    public static volatile SingularAttribute<AuthUser, String> confirmPass;
    public static volatile SingularAttribute<AuthUser, String> userName;
    public static volatile SingularAttribute<AuthUser, Long> userId;

}