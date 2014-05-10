/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.Process;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;

/**
 *
 * @author h10t93
 */
public class AccountManagedBean {

    /**
     * Creates a new instance of AccountManagedBean
     */
    private String user;
    private String pass;
    private ArrayList list;

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public ArrayList getList() {
        return list;
    }

    public void setList(ArrayList list) {
        this.list = list;
    }

    public AccountManagedBean() {
        Process pr = new Process();
        list = pr.viewUserList();
    }

    public String log() {
        Process pr = new Process();
        String result = "fail";

        if (pr.login(user, pass)) {

            result = "ok";
        }
        return result;
    }
}
