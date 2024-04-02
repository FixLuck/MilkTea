package Utils;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JPAUtils {
    private static EntityManagerFactory factory;

    public static EntityManager getEntityManager() {
        if (factory == null || !factory.isOpen()) {
            factory = Persistence.createEntityManagerFactory("milk-tea");
        }
        return factory.createEntityManager();
    }

    public static void shutDown() {
        if (factory != null && factory.isOpen()) {
            factory.close();
        }
        factory = null;
    }
}
