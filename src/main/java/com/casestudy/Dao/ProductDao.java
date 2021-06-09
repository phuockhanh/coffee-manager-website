package com.casestudy.Dao;

import com.casestudy.model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    Connection conn = new ConnectionDao().getConnect();

    public static final String SELECT_ALL = "SELECT * FROM product";

    public static final String SELECT_BY_PRODUCTLINE = "with x as (SELECT p.IdProduct,p.IdPdSmall,p.Name,p.Price,p.PriceKg,p.Image, row_number() over(order by IdProduct) as r\n" +
            "FROM product p join pdlinesmall ps ON  p.idpdsmall = ps.idPdLineSmall join productline pl ON ps.IdProductLine = pl.IdProductLine  \n" +
            "WHERE pl.IdProductLine=? OR ps.idPdLineSmall=?) select * from x where r between ? and ?;";

    public static final String COUNT_PRODUCT = "SELECT COUNT(*) FROM product;";

    public static final String COUNT_CATEGORY = "SELECT COUNT(*) \n" +
            "FROM product p join pdlinesmall ps ON  p.idpdsmall = ps.idPdLineSmall join productline pl ON ps.IdProductLine = pl.IdProductLine \n" +
            "WHERE pl.IdProductLine=? OR ps.idPdLineSmall=?;";

    public static final String FIND_BY_ID = "SELECT * FROM product WHERE idproduct = ?;";

    public static final String SELECT_PAGE = "with x as (SELECT *,row_number() over(order by idproduct) as r from product) select * from x where r between ? and ?;";

    public static final String UPDATE_PRODUCT = "UPDATE `manager_coffee`.`product` SET `IdPdSmall` = ?, `Name` = ?, `Price` = ?, `PriceKg` = ?, `Image` = ?, `Tittle` = ?, `Content` = ? WHERE (`IdProduct` = ?);";

    public static final String DELETE_PRODUCT = "DELETE FROM `product` WHERE (`IdProduct` = ?);" ;

    public static final String NOT_CHECK = "SET FOREIGN_KEY_CHECKS = 0;";

    public static final String CHECK = "SET FOREIGN_KEY_CHECKS = 1;";

    public static final String CREATE_PRODUCT = "INSERT INTO `product` (`IdProduct`, `IdPdSmall`, `Name`, `Price`, `PriceKg`, `Image`, `Tittle`, `Content`) VALUES (?,?,?,?,?,?,?,?);";

    public static final String SORT_PRODUCT_DESC = "with x as (SELECT *,row_number() over(order by price desc) as r from product) select * from x where r between ? and ?;";

    public static final String SORT_PRODUCT = "with x as (SELECT *,row_number() over(order by price) as r from product ) select * from x where r between ? and ?;";

    public static final String SORT_CATEGORY = "with x as (SELECT p.IdProduct,p.IdPdSmall,p.Name,p.Price,p.PriceKg,p.Image,p.Tittle,p.Content, row_number() over(order by price) as r\n" +
            "FROM product p join pdlinesmall ps ON  p.idpdsmall = ps.idPdLineSmall join productline pl ON ps.IdProductLine = pl.IdProductLine  \n" +
            "WHERE pl.IdProductLine=? OR ps.idPdLineSmall=?) select * from x where r between ? and ?;";
    public static final String SORT_CATEGORYDESC = "with x as (SELECT p.IdProduct,p.IdPdSmall,p.Name,p.Price,p.PriceKg,p.Image,p.Tittle,p.Content, row_number() over(order by price desc) as r\n" +
            "FROM product p join pdlinesmall ps ON  p.idpdsmall = ps.idPdLineSmall join productline pl ON ps.IdProductLine = pl.IdProductLine  \n" +
            "WHERE pl.IdProductLine=? OR ps.idPdLineSmall=?) select * from x where r between ? and ?;";
    public List<Product> getAllProduct() throws SQLException {
        List<Product> list = new ArrayList<>();
        try (PreparedStatement statement = conn.prepareStatement(SELECT_ALL);
        ){
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                int id = rs.getInt(1);
                int idPdSmall = rs.getInt(2);
                String name = rs.getString(3);
                double price = rs.getDouble(4);
                double priceKg = rs.getDouble(5);
                String url = rs.getString(6);
                list.add(new Product(id,idPdSmall,name,price,priceKg,url));
            }
        }
        return list;
    }
    public List<Product> sort(int start,int end) throws SQLException{
        List<Product> list = new ArrayList<>();
        PreparedStatement statement = conn.prepareStatement(SORT_PRODUCT);
        statement.setInt(1,start);
        statement.setInt(2,end);
        ResultSet rs = statement.executeQuery();
        while (rs.next()){
            int id = rs.getInt(1);
            int idline = rs.getInt(2);
            String name = rs.getString(3);
            double price = rs.getDouble(4);
            double pricekg = rs.getDouble(5);
            String url = rs.getString(6);
            String title = rs.getString(7);
            String content = rs.getString(8);
            list.add(new Product(id,idline,name,price,pricekg,url,title,content));
        }
        return list;
    }
    public List<Product> sortDesc(int start,int end) throws SQLException{
        List<Product> list = new ArrayList<>();
        PreparedStatement statement = conn.prepareStatement(SORT_PRODUCT_DESC);
        statement.setInt(1,start);
        statement.setInt(2,end);
        ResultSet rs = statement.executeQuery();
        while (rs.next()){
            int id = rs.getInt(1);
            int idline = rs.getInt(2);
            String name = rs.getString(3);
            double price = rs.getDouble(4);
            double pricekg = rs.getDouble(5);
            String url = rs.getString(6);
            String title = rs.getString(7);
            String content = rs.getString(8);
            list.add(new Product(id,idline,name,price,pricekg,url,title,content));
        }
        return list;
    }
    public List<Product> sortCate(int id, int start,int end) throws SQLException{
        List<Product> list = new ArrayList<>();
        try (PreparedStatement statement = conn.prepareStatement(SORT_CATEGORY);
        ){
            statement.setInt(1,id);
            statement.setInt(2,id);
            statement.setInt(3,start);
            statement.setInt(4,end);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                int id2 = rs.getInt(1);
                int idline = rs.getInt(2);
                String name = rs.getString(3);
                double price = rs.getDouble(4);
                double pricekg = rs.getDouble(5);
                String url = rs.getString(6);
                String title = rs.getString(7);
                String content = rs.getString(8);
                list.add(new Product(id2,idline,name,price,pricekg,url,title,content));
            }
        }
        return list;
    }
    public List<Product> sortCateDesc(int id, int start,int end) throws SQLException{
        List<Product> list = new ArrayList<>();
        try (PreparedStatement statement = conn.prepareStatement(SORT_CATEGORYDESC);
        ){
            statement.setInt(1,id);
            statement.setInt(2,id);
            statement.setInt(3,start);
            statement.setInt(4,end);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                int id2 = rs.getInt(1);
                int idline = rs.getInt(2);
                String name = rs.getString(3);
                double price = rs.getDouble(4);
                double pricekg = rs.getDouble(5);
                String url = rs.getString(6);
                String title = rs.getString(7);
                String content = rs.getString(8);
                list.add(new Product(id2,idline,name,price,pricekg,url,title,content));
            }
        }
        return list;
    }
    public void check() throws SQLException {
        PreparedStatement statement = conn.prepareStatement(CHECK);
        statement.execute();
    }
    public void notCheck() throws SQLException {
        PreparedStatement statement = conn.prepareStatement(NOT_CHECK);
        statement.execute();
    }
    public boolean deleteProduct(int id) throws SQLException{
        boolean delete;
        notCheck();
        try (PreparedStatement statement = conn.prepareStatement(DELETE_PRODUCT)){
            statement.setInt(1,id);
            delete = statement.executeUpdate()>0;
        }
        check();
        return delete;
    }
    public void createProduct(Product product) throws SQLException{
        PreparedStatement statement = conn.prepareStatement(CREATE_PRODUCT);
        statement.setInt(1,product.getId());
        statement.setInt(2,product.getIdPdSmall());
        statement.setString(3,product.getName());
        statement.setDouble(4,product.getPrice());
        statement.setDouble(5,product.getPriceKg());
        statement.setString(6,product.getUrl());
        statement.setString(7, product.getTitle());
        statement.setString(8,product.getContent());
        statement.executeUpdate();
    }
    public boolean updateProduct(int id,Product product) throws SQLException{
        boolean edit;
        try (PreparedStatement statement = conn.prepareStatement(UPDATE_PRODUCT)){
            statement.setInt(1,product.getIdPdSmall());
            statement.setString(2,product.getName());
            statement.setDouble(3,product.getPrice());
            statement.setDouble(4,product.getPriceKg());
            statement.setString(5,product.getUrl());
            statement.setString(6,product.getTitle());
            statement.setString(7,product.getContent());
            statement.setInt(8,id);
            edit = statement.executeUpdate()>0;
        }
        return edit;
    }
    public List<Product> getProductByCategory(int id, int start,int end) throws SQLException{
        List<Product> list = new ArrayList<>();
        try (PreparedStatement statement = conn.prepareStatement(SELECT_BY_PRODUCTLINE);
        ){
            statement.setInt(1,id);
            statement.setInt(2,id);
            statement.setInt(3,start);
            statement.setInt(4,end);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                int id2 = rs.getInt(1);
                int idPdSmall = rs.getInt(2);
                String name = rs.getString(3);
                double price = rs.getDouble(4);
                double priceKg = rs.getDouble(5);
                String url = rs.getString(6);
                list.add(new Product(id2,idPdSmall,name,price,priceKg,url));
            }
        }
        return list;
    }
    public Product findById(int id) throws SQLException{
        try (PreparedStatement statement = conn.prepareStatement(FIND_BY_ID);
        ){
            statement.setInt(1,id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                int id2 = rs.getInt(1);
                int idline = rs.getInt(2);
                String name = rs.getString(3);
                double price = rs.getDouble(4);
                double pricekg = rs.getDouble(5);
                String url = rs.getString(6);
                String title = rs.getString(7);
                String content = rs.getString(8);
                return new Product(id2,idline,name,price,pricekg,url,title,content);
            }
        }
        return null;
    }
    public int count() throws SQLException{
        try (PreparedStatement statement = conn.prepareStatement(COUNT_PRODUCT);
        ){

            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                return rs.getInt(1);
            }
        }
        return 0;
    }
    public int count_cate(int id) throws SQLException{
        try (PreparedStatement statement = conn.prepareStatement(COUNT_CATEGORY);
        ){
            statement.setInt(1,id);
            statement.setInt(2,id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                return rs.getInt(1);
            }
        }
        return 0;
    }
    public List<Product> getProductPage(int start, int end) throws SQLException {
        List<Product> list = new ArrayList<>();
        try (PreparedStatement statement = conn.prepareStatement(SELECT_PAGE);
        ) {
            statement.setInt(1,start);
            statement.setInt(2,end);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                int idPdSmall = rs.getInt(2);
                String name = rs.getString(3);
                double price = rs.getDouble(4);
                double priceKg = rs.getDouble(5);
                String url = rs.getString(6);
                list.add(new Product(id, idPdSmall, name, price, priceKg, url));
            }
        }
        return list;
    }
}
