/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.ProductsPurchased;
import entity.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author h10t93
 */
public class Process {

    PreparedStatement preparedStatement;
    ResultSet resultSet;
    Connection connection;
    String user;
    String pass;
    Statement stm;
    CallableStatement cs;

    public Process(String user, String pass) {
        this.user = user;
        this.pass = pass;
    }

    public Process() {
    }

    public Connection getConnection() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); // day la 1

            String sql = "jdbc:sqlserver://localhost:1433;databaseName=moneyManagerDB"; // day ;a 3
            String user1 = "sa"; // dat ten phai khac user va password
            String pass1 = "asdasd";
            try {
                connection = DriverManager.getConnection(sql, user1, pass1);
            } catch (SQLException ex) {
                Logger.getLogger(Process.class.getName()).log(Level.SEVERE, null, ex);
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Process.class.getName()).log(Level.SEVERE, null, ex);
        }
        return connection;
    }

    public void disConnection() {
        try {
            if (connection != null) {

                connection.close();
            }

        } catch (SQLException ex) {
            Logger.getLogger(Process.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
//login 

    public boolean login(String u, String p) {
        try {
            String query = "select * from tblUser where username = ? and pwd = ?";
            preparedStatement = getConnection().prepareStatement(query);
            preparedStatement.setString(1, u);
            preparedStatement.setString(2, p);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Process.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
// view user list

    public ArrayList viewUserList() {
        ArrayList list = new ArrayList();
        try {
            String sql = "select * from tblUser";
            resultSet = getConnection().createStatement().executeQuery(sql);
            while (resultSet.next()) {
                User u = new User();
                u.setId1(resultSet.getInt(1));
                u.setName(resultSet.getString(2));
                u.setUsername(resultSet.getString(3));
                u.setPass(resultSet.getString(4));
                list.add(u);
            }
            resultSet.close();

        } catch (SQLException ex) {
            Logger.getLogger(Process.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    // ghi tien 
    public boolean recordCash(entity.AmountDetail am) {
        int result = 0;
        try {
            cs = getConnection().prepareCall("addBill ?,?,?,?");
            cs.setInt(1, 1);
            cs.setInt(2, 2);
            cs.setString(3, am.getUnitProduct());
            cs.setFloat(4, am.getPrice());
            result = cs.executeUpdate();
            cs.close();
            disConnection();
        } catch (SQLException ex) {
            Logger.getLogger(Process.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return result>0;
    }

    // xem san pham da mua
    public ArrayList viewProdctPurchased() {
        ArrayList list = new ArrayList();
        try {
            CallableStatement calstm = getConnection().prepareCall("viewProductPurchased");
            resultSet = calstm.executeQuery();
            while (resultSet.next()) {
                entity.ProductsPurchased products = new entity.ProductsPurchased();
                products.setCategorizeID(resultSet.getInt("cateID"));
                products.setCategorizeName(resultSet.getString("cateName"));
                products.setDate(resultSet.getString("dateBuy"));
                products.setNameUser(resultSet.getString("name"));
                products.setPrice(resultSet.getFloat("price"));
                products.setProductDes(resultSet.getNString("productDes"));
                products.setProductID(resultSet.getInt("productID"));
                products.setProductName(resultSet.getString("productName"));
                products.setProductUnit(resultSet.getString("productUnit"));
                products.setUserID(resultSet.getInt("userID"));
                list.add(products);

            }
            resultSet.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
