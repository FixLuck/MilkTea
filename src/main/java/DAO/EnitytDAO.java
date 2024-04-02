package DAO;

import java.util.List;

public interface EnitytDAO<E, key> {
    abstract public E creat(E entity);

    abstract public E update(E entity);

    abstract public E remove(int key);

    abstract public E findById(int key);

    abstract public List<E> findByKeyWord(String key);

    abstract public List<E> findAll();

}
