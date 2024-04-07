package DAO;

import entity.Products;

import java.util.ArrayList;
import java.util.List;

public class Test {
    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();


        List<Products> list = new ArrayList<>();
        list = dao.findProductsByCategoryId(1);
        for (Products i: list
             ) {
            System.out.println(i.getProdName());
        }



    }
}
