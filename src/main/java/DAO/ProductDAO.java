package DAO;

import Utils.JPAUtils;
import entity.Products;
import entity.Users;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;

public class ProductDAO implements EnitytDAO<Products, Integer>{

    private final EntityManager entityManager = JPAUtils.getEntityManager();


    @Override
    public Products creat(Products entity) {
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
    public Products update(Products entity) {
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
    public Products remove(int key) {
        try {
            entityManager.getTransaction().begin();
            Products entity = this.findById(key);
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
    public Products findById(int key) {
        return entityManager.find(Products.class, key);
    }

    @Override
    public List<Products> findByKeyWord(String key) {
        String jpql = "Select o From Products o where o.prodName like ?1";
        TypedQuery<Products> query = entityManager.createQuery(jpql, Products.class);
        query.setParameter(1, "%" + key + "%");
        return query.getResultList();
    }

    @Override
    public List<Products> findAll() {
        String jpql = "Select o From Users o";
        TypedQuery<Products> query = entityManager.createQuery(jpql, Products.class);
        return query.getResultList();
    }
}
