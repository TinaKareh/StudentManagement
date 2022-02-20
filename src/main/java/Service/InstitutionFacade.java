/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Service;

import Model.Institution;
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
public class InstitutionFacade extends AbstractFacade<Institution> {

    @PersistenceContext(unitName = "javaBioPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public InstitutionFacade() {
        super(Institution.class);
    }

    public Institution addInstitution(String institutionName) {

        String jpql = "SELECT a FROM Institution a WHERE a.institutionName = :institution";
        Query query = getEntityManager().createQuery(jpql);
        query.setParameter("institution", institutionName);

        try {
            return (Institution) query.getSingleResult();
        } catch (Exception x) {
            return null;
        }
    }
    
//    public Institution deleteInstitution(){
//     String jpql = "SELECT a FROM Institution a WHERE a.institutionName = :institution";
//        Query query = getEntityManager().createQuery(jpql);
//        query.setParameter("institution", institutionName);
//
//        try {
//            return (Institution) query.getSingleResult();
//        } catch (Exception x) {
//            return null;
//        }
//    }
    

}
