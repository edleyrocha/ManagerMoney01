/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.sql.SQLException;

/**
 *
 * @author h10t93
 */
public class NewClass {
    public static void main(String[] args) throws SQLException {
        Process p = new Process();
        System.out.println(p.viewUserList());
    }
}
