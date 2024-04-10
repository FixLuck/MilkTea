package DAO;

import entity.Categories;
import entity.Products;
import entity.Users;

import java.util.ArrayList;
import java.util.List;

public class Test {
    public static void main(String[] args) {
        try {
            CategoryDAO cdao = new CategoryDAO();
            Products p = new Products();
            Categories categories = cdao.findById(1);
            p.setCategoriesByCategoryId(categories);
            p.setProdName("Salt Coffee");
            p.setPrice(3.0F);
            ProductDAO pdao = new ProductDAO();
            pdao.creat(p);
        } catch (Exception e) {
            e.printStackTrace();
        }





    }
}
