package DAO;

import Utils.JPAUtils;
import entity.Categories;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;

public class CategoryDAO implements EnitytDAO<Categories, Integer>{
    private final EntityManager entityManager = JPAUtils.getEntityManager();


    @Override
    public Categories creat(Categories entity) {
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
    public Categories update(Categories entity) {
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
    public Categories remove(int key) {
        try {
            entityManager.getTransaction().begin();
            Categories entity = this.findById(key);
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
    public Categories findById(int key) {
        return entityManager.find(Categories.class, key);
    }

    @Override
    public List<Categories> findByKeyWord(String key) {
        return null;
    }

    @Override
    public List<Categories> findAll() {
        String jpql ="Select o From Categories o";
        TypedQuery<Categories> query = entityManager.createQuery(jpql, Categories.class);
        return query.getResultList();
    }

    public List<String> findAllNameCategories() {
        String jpql ="Select o.name From Categories o";
        TypedQuery<String> query = entityManager.createQuery(jpql, String.class);
        return query.getResultList();
    }


}
