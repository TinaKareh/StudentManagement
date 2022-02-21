/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Service;

import Model.AuthUser;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Futuristic Ltd
 */
@Stateless
public class AuthUserFacade extends AbstractFacade<AuthUser> {

    @PersistenceContext(unitName = "javaBioPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AuthUserFacade() {
        super(AuthUser.class);
    }
   
        public AuthUser getUserByEmailAddressAndPassword(String emailAddress, String password) {
        String jpql = "SELECT a FROM AuthUser a WHERE a.emailAddress = :email and a.password = :password";
        Query query = getEntityManager().createQuery(jpql);
        query.setParameter("email", emailAddress);
        query.setParameter("password", password);

        
         try {
            return (AuthUser) query.getSingleResult();
        } catch (Exception x) {
            return null;
        }
        
    }
}
