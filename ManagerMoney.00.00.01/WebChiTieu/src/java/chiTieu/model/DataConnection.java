/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package chiTieu.model;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author h10t93
 */
public class DataConnection {

    private Connection con;

    public Connection getConnection() {
        String sql = "";
        String user = "sa";
        String pass = "asdasd";
        try {
            con = DriverManager.getConnection(sql, user, pass);
        } catch (SQLException ex) {
            Logger.getLogger(DataConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
    }
//dissconnection

    public void disCon() {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(DataConnection.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
