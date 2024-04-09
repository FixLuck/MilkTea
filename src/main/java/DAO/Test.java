package DAO;

import entity.Products;
import entity.Users;

import java.util.ArrayList;
import java.util.List;

public class Test {
    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();
        Users a  = userDAO.getAccount("user1", "user123");
        String role = a.getRolesByRoleId().getRoleName();
        System.out.println(role);



    }
}
