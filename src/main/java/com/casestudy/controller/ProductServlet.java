package com.casestudy.controller;

import com.casestudy.Dao.OrderDao;
import com.casestudy.Dao.ProductDao;
import com.casestudy.Dao.UserDao;
import com.casestudy.model.Item;
import com.casestudy.model.Order;
import com.casestudy.model.Product;
import com.casestudy.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
@WebServlet(name = "ProductServlet", urlPatterns = "/product")
public class ProductServlet extends HttpServlet {
    ProductDao dao = new ProductDao();
    UserDao userDao = new UserDao();
    private static String actionBefore;
    private static int idBefore;
    int count2=0;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action ="";
        }
        switch (action){
            case "create":{
                showCreateForm(request,response);
                break;
            }
            case "edit":{
                try {
                    showFormEdit(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            }
            case "delete":{
                try {
                    deleteProduct(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            }
            case "shop":{
                try {
                    showShop(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                actionBefore = action;
                break;
            }
            case "sort":{
                try {
                    sortProduct(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            }
            case "category":{
                try {
                    categoryShop(request,response);
                    idBefore =Integer.parseInt(request.getParameter("id"));
                    actionBefore = action;
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            }
            case "login":{
                showLoginForm(request,response);
                break;
            }
            case "logout":{
                logOutUser(request,response);
                break;
            }
            case "detail":{
                try {
                    showProductDetail(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
            case "cart":{
                showCartForm(request,response);
                break;
            }
            case "deleteSs":{
                deleteProductSs(request,response);
                break;
            }
            case "payment":{
                try {
                    payment(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            }
            default:{
                try {
                    showIndex(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            }
        }
    }

    private void sortProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        if(!actionBefore.equals("category")){
            String action = request.getParameter("action");
            List<Product> list = new ArrayList<>();
            int count = dao.count();
            int size = 15;
            int lengthPage = count/size;
            if(count%size!=0){
                lengthPage++;
            }
            String page =request.getParameter("page");
            if(page==null){
                count2++;
            }
            if(page==null){
                page = "1";
            }
            int pageNumber = Integer.parseInt(page);
            int start = size*pageNumber - (size-1);
            int end = start+size-1;
            if(end>count){
                end=count;
            }
            if(count2%2==0){
                list = dao.sort(start,end);
                count2=count2+2;
            }
            if(count2%2!=0){
                list = dao.sortDesc(start,end);
                count2+=2;
            }
            if(lengthPage>1){
                request.setAttribute("numberList",lengthPage);
                request.setAttribute("action",action);
                request.setAttribute("page",page);
            }
            request.setAttribute("arrow",count2);
            request.setAttribute("shop",list);
            request.getRequestDispatcher("product/shop.jsp").forward(request,response);
        }
        else{
            List<Product> list = new ArrayList<>();
            int count = dao.count_cate(idBefore);
            int size = 15;
            int lengthPage = count/size;
            if(count%size!=0){
                lengthPage++;
            }
            String page =request.getParameter("page");
            if(page==null){
                page = "1";
                count2++;
            }
            int pageNumber = Integer.parseInt(page);
            int start = size*pageNumber - (size-1);
            int end = start+size-1;
            if(end>count){
                end=count;
            }
            if(count2%2==0){
                list = dao.sortCate(idBefore,start,end);
                count2=count2+2;
            }
            if(count2%2!=0){
                list = dao.sortCateDesc(idBefore,start,end);
                count2+=2;
            }
            if(lengthPage>1){
                request.setAttribute("numberList",lengthPage);
                request.setAttribute("action",actionBefore);
                request.setAttribute("page",page);
            }
            request.setAttribute("arrow",count2);
            request.setAttribute("shop",list);
            request.getRequestDispatcher("product/shop.jsp").forward(request,response);
        }
    }
    private void categoryShop(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id =Integer.parseInt(request.getParameter("id"));
        String action = request.getParameter("action");
        int count = dao.count_cate(id);
        int size = 15;
        int lengthPage = count/size;
        if(count%size!=0){
            lengthPage++;
        }
        String page =request.getParameter("page");
        if(page==null){
            page = "1";
        }
        int pageNumber = Integer.parseInt(page);
        int start = size*pageNumber - (size-1);
        int end = start+size-1;
        if(end>count){
            end=count;
        }
        List<Product> list = dao.getProductByCategory(id,start,end);
        request.setAttribute("id",id);
        if(lengthPage>1){
            request.setAttribute("page",page);
            request.setAttribute("action",action);
            request.setAttribute("numberList",lengthPage);
        }
        request.setAttribute("shop",list);
        User user = (User) request.getSession().getAttribute("acc");
        request.setAttribute("user",user);
        request.getRequestDispatcher("product/shop.jsp").forward(request,response);
    }
    private void showShop(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int count = dao.count();
        String action = request.getParameter("action");
        int size = 15;
        int lengthPage = count/size;
        if(count%size!=0){
            lengthPage++;
        }
        String page =request.getParameter("page");
        if(page==null){
            page = "1";
        }
        int pageNumber = Integer.parseInt(page);
        int start = size*pageNumber - (size-1);
        int end = start+size-1;
        if(end>count){
            end=count;
        }
        List<Product> list = dao.getProductPage(start,end);
        if(lengthPage>1){
            request.setAttribute("numberList",lengthPage);
            request.setAttribute("action",action);
            request.setAttribute("page",page);
        }
        request.setAttribute("shop",list);
        request.getRequestDispatcher("product/shop.jsp").forward(request,response);
    }

    private void showIndex(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ServletException {
        response.sendRedirect("product/index.jsp");
    }
    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("product/create.jsp").forward(request,response);
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        dao.deleteProduct(id);
        showShop(request,response);
    }

    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = dao.findById(id);
        request.setAttribute("product",product);
        request.getRequestDispatcher("product/edit.jsp").forward(request,response);
    }

    private void payment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        User user = (User) request.getSession().getAttribute("acc");
        if(user==null){
            request.getRequestDispatcher("product/login.jsp").forward(request,response);
        }
        else{
            Order order = (Order) request.getSession().getAttribute("order");
            order.setUser(user);
            new OrderDao().addOrder(order);
            request.getSession().removeAttribute("order");
            response.sendRedirect("/product");
        }
    }

    private void deleteProductSs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Order order = (Order) request.getSession().getAttribute("order");
        List<Item> list = order.getItems();
        for(int i=0;i<list.size();i++){
            if(list.get(i).getProduct().getId()==id){
                list.remove(i);
            }
        }
        order.setItems(list);
        request.getSession().setAttribute("order",order);
        showCartForm(request,response);
    }

    private void showCartForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Order order = (Order) session.getAttribute("order");
        List<Item> list = order.getItems();
        double totalPrice =0;
        for(int i=0;i<list.size();i++){
            totalPrice+=list.get(i).getAmount()*list.get(i).getPrice();
        }
        String voucher = request.getParameter("voucher");
        System.out.println(voucher);
        int discount =0;
        if(voucher!=null){
            if(voucher.equals("KHANHDEPTRAI")){
                discount = 20;
                System.out.println(discount);
                request.setAttribute("voucher",discount);
                double ship = 1.5;
                double total = totalPrice*0.8+ship;
                request.setAttribute("totalPrice",totalPrice);
                request.setAttribute("ship",ship);
                request.setAttribute("total",total);
            }
        }
        else{
            request.setAttribute("voucher",discount);
            double ship = 1.5;
            double total = totalPrice+ship;
            request.setAttribute("totalPrice",totalPrice);
            request.setAttribute("ship",ship);
            request.setAttribute("total",total);
        }
        request.getRequestDispatcher("product/cart.jsp").forward(request,response);
    }


    private void logOutUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("acc");
        request.getRequestDispatcher("product?action=shop").forward(request,response);
    }

    private void showLoginForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("product/login.jsp").forward(request,response);
    }

    private void showProductDetail(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = dao.findById(id);
        request.setAttribute("product",product);
        request.getRequestDispatcher("product/detailProduct.jsp").forward(request,response);
    }





    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action ="";
        }
        switch (action){
            case "create":{
                try {
                    createProduct(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            }
            case "edit":{
                try {
                    editProduct(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            }
            case "coupon":{
                addCoupon(request,response);
                break;
            }
            case "login":{
                try {
                    checkLogin(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            }
            case "register":{
                try {
                    checkRegister(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            }
            case "cart":{
                try {
                    addCart(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            }

            case "delete":{
                break;
            }
        }
    }

    private void addCoupon(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Order order = (Order) session.getAttribute("order");
        List<Item> list = order.getItems();
        double totalPrice =0;
        for(int i=0;i<list.size();i++){
            totalPrice+=list.get(i).getAmount()*list.get(i).getPrice();
        }
        String voucher = request.getParameter("voucher");
        System.out.println(voucher);
        int discount =0;
        if(voucher.equals("KHANHDEPTRAI") || voucher.equals("BINHDEPTRAI")){
            discount = 20;
            System.out.println(discount);
            request.setAttribute("voucher",discount);
            double ship = 1.5;
            double total = totalPrice*0.8+ship;
            request.setAttribute("totalPrice",totalPrice);
            request.setAttribute("ship",ship);
            request.setAttribute("total",total);
        }
        else{
            request.setAttribute("voucher",discount);
            double ship = 1.5;
            double total = totalPrice+ship;
            request.setAttribute("totalPrice",totalPrice);
            request.setAttribute("ship",ship);
            request.setAttribute("total",total);
        }
        request.getRequestDispatcher("product/cart.jsp").forward(request,response);
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("idCr"));
        String name = request.getParameter("nameCr");
        int idPdSm = Integer.parseInt(request.getParameter("idSmCr"));
        double price = Double.parseDouble(request.getParameter("priceCr"));
        double priceKg = Double.parseDouble(request.getParameter("priceKgCr"));
        String url = request.getParameter("urlCr");
        String title = request.getParameter("titleCr");
        String content = request.getParameter("contentCr");
        Product product = new Product(id,idPdSm,name,price,priceKg,url,title,content);
        dao.createProduct(product);
        request.getRequestDispatcher("product/create.jsp").forward(request,response);
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("nameEd");
        int idPdSm = Integer.parseInt(request.getParameter("idSmEd"));
        double price = Double.parseDouble(request.getParameter("priceEd"));
        double priceKg = Double.parseDouble(request.getParameter("priceKgEd"));
        String url = request.getParameter("urlEd");
        String title = request.getParameter("titleEd");
        String content = request.getParameter("contentEd");
        Product product = new Product(id,idPdSm,name,price,priceKg,url,title,content);
        dao.updateProduct(id,product);
        showShop(request,response);
    }

    private void checkRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String user = request.getParameter("nameRg");
        String pass = request.getParameter("passRg");
        String pass2 = request.getParameter("pass2Rg");
        String phone = request.getParameter("phoneRg");
        String address = request.getParameter("addressRg");
        String email = request.getParameter("emailRg");
        if(!pass.equals(pass2) || userDao.findByUserName(user)!=null){
            request.getRequestDispatcher("product/login.jsp").forward(request,response);
        }
        else{
            userDao.addUser(new User(user,pass,phone,address,email));
            request.getRequestDispatcher("product/login.jsp").forward(request,response);
        }
    }

    private void checkLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String userName = request.getParameter("nameLg");
        String passWord = request.getParameter("passLg");
        User user = userDao.checkLoginDTB(userName,passWord);
        if(user!=null){
            HttpSession session = request.getSession();
            session.setAttribute("acc",user);
            showShop(request,response);
        }
        else{
            request.getRequestDispatcher("product/login.jsp").forward(request,response);
        }
    }
    private void addCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int amount =Integer.parseInt(request.getParameter("amount")) ;
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = dao.findById(id);
        HttpSession session = request.getSession();
        if(session.getAttribute("order")==null){
            Order order = new Order();
            List<Item> list = new ArrayList<>();
            Item item = new Item();
            item.setAmount(amount);
            item.setProduct(product);
            item.setPrice(product.getPrice());
            list.add(item);
            order.setItems(list);
            session.setAttribute("order",order);
        }
        else{
            Order order = (Order) session.getAttribute("order");
            List<Item> list = order.getItems();
            boolean check = false;
            for(int i=0;i<list.size();i++){
                if(list.get(i).getProduct().getId()==product.getId()){
                    list.get(i).setAmount(list.get(i).getAmount()+amount);
                    check = true;
                }
            }
            if(check==false){
                Item item = new Item();
                item.setAmount(amount);
                item.setProduct(product);
                item.setPrice(product.getPrice());
                list.add(item);
            }
            session.setAttribute("order",order);
        }
        Product product1 = dao.findById(id);
        request.setAttribute("product",product1);
        request.getRequestDispatcher("product/detailProduct.jsp").forward(request,response);
    }

}
