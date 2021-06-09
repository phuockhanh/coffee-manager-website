package com.casestudy.Dao;

import com.casestudy.model.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class OrderDao {
    Connection conn = new ConnectionDao().getConnect();
    private final String ADD_ORDER = "INSERT INTO `order` (`IdProduct`, `UserName`, `Amount`) VALUES (?, ?, ?);";
    public void addOrder(Order order) throws SQLException {
        for(int i=0;i<order.getItems().size();i++){
            PreparedStatement statement = conn.prepareStatement(ADD_ORDER);
            statement.setInt(1,order.getItems().get(i).getProduct().getId());
            statement.setString(2,order.getUser().getUserName());
            statement.setInt(3,order.getItems().get(i).getAmount());
            statement.executeUpdate();
        }
    }
}
