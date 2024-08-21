/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.auth;

import dto.AccountDAO;
import java.util.TimerTask;

/**
 *
 * @author nocol
 */
public class DeleteAccountTask extends TimerTask {

    @Override
    public void run() {
        
        AccountDAO dbAcc = new AccountDAO();
        dbAcc.deleteOTPByUsername();
        
    }
}
