/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

/**
 *
 * @author h10t93
 */
public class ProductsPurchased {
    private int userID;
    private int productID;
    private String nameUser;
    private int categorizeID;
    private String CategorizeName;
    private String productName;
    private String productDes;
    private int totalDetailID;
    private String productUnit;
    private String date;
    private float price;

    public String getNameUser() {
        return nameUser;
    }

    public void setNameUser(String nameUser) {
        this.nameUser = nameUser;
    }

    public int getCategorizeID() {
        return categorizeID;
    }

    public void setCategorizeID(int categorizeID) {
        this.categorizeID = categorizeID;
    }

    public String getCategorizeName() {
        return CategorizeName;
    }

    public void setCategorizeName(String CategorizeName) {
        this.CategorizeName = CategorizeName;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDes() {
        return productDes;
    }

    public void setProductDes(String productDes) {
        this.productDes = productDes;
    }

    public int getTotalDetailID() {
        return totalDetailID;
    }

    public void setTotalDetailID(int totalDetailID) {
        this.totalDetailID = totalDetailID;
    }

    
    public ProductsPurchased() {
    }
    
    
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductUnit() {
        return productUnit;
    }

    public void setProductUnit(String productUnit) {
        this.productUnit = productUnit;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

}
