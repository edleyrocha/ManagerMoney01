/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

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

    public Process(String user, String pass) {
        this.user = user;
        this.pass = pass;
    }

    public Process() {
    }

    public Connection getConnection() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); // day la 1
            
            String sql = "jdbc:sqlserver://localhost:1433;databaseName=dbManagerMoney"; // day ;a 3
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
        if (connection != null) {
            try {
                resultSet.close();
                preparedStatement.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(Process.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
//login 

    public boolean login(String u, String p) {
        try {
//            connection = getConnection(); // day la 2
            String query = "select * from tblUser where USERNAME = ? and PASS = ?";//cai nay lay trong database, to k biet ten cot
            preparedStatement = getConnection().prepareStatement(query);
            preparedStatement.setString(1, u);
            preparedStatement.setString(2, p);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next())
            {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Process.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
// view user list

    public ArrayList viewUserList() {
        ArrayList list = new ArrayList();
//         connection = getConnection(); 
        try {
            String sql = "select * from tblUser";
             resultSet=getConnection().createStatement().executeQuery(sql);
            while (resultSet.next()) {
                User u = new User();
                u.setId(resultSet.getInt(1));
                u.setName(resultSet.getString(2));
                u.setUsername(resultSet.getString(3));
                u.setPass(resultSet.getString(4));
                list.add(u);
            }
           resultSet.close();
        } catch (SQLException ex) {
            Logger.getLogger(Process.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
