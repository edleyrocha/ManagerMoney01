/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.AmountDetail;
import entity.ProductsPurchased;
import java.sql.SQLException;

/**
 *
 * @author h10t93
 */
public class NewClass {

    public static void main(String[] args) throws SQLException {
        Process p = new Process();
        p.viewProdctPurchased();
        entity.ProductsPurchased a = new ProductsPurchased();
        a = (ProductsPurchased) p.viewProdctPurchased().get(0);
        entity.AmountDetail am = new AmountDetail();
        am.setUnitProduct("100");
        am.setPrice(120);

        System.out.println(p.recordCash(am));
    }
}
