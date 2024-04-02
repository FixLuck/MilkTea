package DAO;

import Utils.DBContext;
import entity.Cart;
import entity.Item;
import entity.Users;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

public class OrderDAO extends DBContext {
    public void addOrder(Users user, Cart cart) {
        LocalDate currDate = LocalDate.now();
        String date = currDate.toString();
        try {
            String insertOrder = "insert into Orders values (?, ?, ?)";
            PreparedStatement st = conn.prepareStatement(insertOrder);
            st.setString(1, date);
            st.setDouble(2, cart.getTotalMoney());
            st.setInt(3, user.getUserId());
            st.executeUpdate();
            //lấy ra order id đầu tiên vừa add
            String getFirstOrder = "select top 1 OrderId from Orders order by OrderId desc";
            PreparedStatement st1 = conn.prepareStatement(getFirstOrder);
            ResultSet rs = st1.executeQuery();
            //add vào bảng OrderDetail
            if (rs.next()) {
                int orderId = rs.getInt("OrderId");
                for (Item i : cart.getItems()
                ) {
                    String addOrderDetail = "insert into OrderDetails values (?, ?, ?, ?)";
                    PreparedStatement st2 = conn.prepareStatement(addOrderDetail);
                    st2.setInt(1, i.getQuantity());
                    st2.setDouble(2, i.getPrice());
                    st2.setInt(3, i.getProduct().getProductId());
                    st2.setInt(4, orderId);
                    st2.executeUpdate();
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
