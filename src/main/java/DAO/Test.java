package DAO;

import entity.Products;

import java.util.ArrayList;
import java.util.List;

public class Test {
    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();


        List<Products> list = new ArrayList<>();
        list = dao.findByKeyWord("Espresso");
        for (Products i: list
             ) {
            System.out.println(i.getCategoriesByCategoryId().getName());
        }
    }
}
