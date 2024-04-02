package DAO;

import Utils.JPAUtils;
import entity.Categories;
import entity.Users;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;

public class UserDAO implements EnitytDAO<Users, Integer>{
    private final EntityManager entityManager = JPAUtils.getEntityManager();


    @Override
    public Users creat(Users entity) {
        try {
            entityManager.getTransaction().begin();

            entityManager.persist(entity);

            entityManager.getTransaction().commit();

        } catch (Exception e) {
            entityManager.getTransaction().rollback();

            e.printStackTrace();
        }
        return entity;
    }

    @Override
    public Users update(Users entity) {
        try {
            entityManager.getTransaction().begin();

            entityManager.merge(entity);

            entityManager.getTransaction().commit();

        } catch (Exception e) {
            entityManager.getTransaction().rollback();

            e.printStackTrace();
        }
        return entity;
    }

    @Override
    public Users remove(int key) {
        try {
            entityManager.getTransaction().begin();
            Users entity = this.findById(key);
            entityManager.remove(entity);
            entityManager.getTransaction().commit();
            return entity;
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Users findById(int key) {
        return entityManager.find(Users.class, key);
    }

    @Override
    public List<Users> findByKeyWord(String key) {
        return null;
    }

    @Override
    public List<Users> findAll() {
        String jpql = "Select o From Users o";
        TypedQuery<Users> query = entityManager.createQuery(jpql, Users.class);
        return query.getResultList();
    }

    public Users getAccount(String user, String password) {
        String jpql = "Select o From Users o where o.userName =:user and o.password =:password";
        TypedQuery<Users> query = entityManager.createQuery(jpql, Users.class);
        query.setParameter("user", user);
        query.setParameter("password", password);
        return query.getSingleResult();
    }
}
