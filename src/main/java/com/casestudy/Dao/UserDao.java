package com.casestudy.Dao;

import com.casestudy.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
    Connection conn = new ConnectionDao().getConnect();
    private final String SELECT_USER = "SELECT * FROM user WHERE username =? AND password =?;";
    private final String INSERT_USER = "INSERT INTO `manager_coffee`.`user` (`UserName`, `PassWord`, `Phone`, `Address`,`Email`) VALUES (?,?,?,?,?);";
    private final String FIND_USER = "SELECT * FROM user WHERE username=?;";
    public User checkLoginDTB(String user, String pass) throws SQLException {
        try (PreparedStatement statement = conn.prepareStatement(SELECT_USER);){
            statement.setString(1,user);
            statement.setString(2,pass);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                String userName2 = rs.getString(1);
                String passWord = rs.getString(2);
                String phone = rs.getString(3);
                String address = rs.getString(4);
                String email = rs.getString(5);
                return new User(userName2,passWord,phone,address,email);
            }
        }
        return null;
    }
    public void addUser(User user) throws SQLException{
        try (PreparedStatement statement = conn.prepareStatement(INSERT_USER)){
            statement.setString(1,user.getUserName());
            statement.setString(2,user.getPassWord());
            statement.setString(3,user.getPhone());
            statement.setString(4,user.getAddress());
            statement.setString(5,user.getEmail());
            statement.executeUpdate();
        }
    }
    public User findByUserName(String userName) throws SQLException{
        try (PreparedStatement statement = conn.prepareStatement(FIND_USER)){
            statement.setString(1,userName);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                String userName2 = rs.getString(1);
                String passWord = rs.getString(2);
                String phone = rs.getString(3);
                String address = rs.getString(4);
                String email = rs.getString(5);
                return new User(userName2,passWord,phone,address,email);
            }
        }
        return null;
    }
}
