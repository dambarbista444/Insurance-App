//
//  UserLoginHandler.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 8/21/21.
//

import Foundation
import UIKit

/// This part will get user email and password from  login tableviewCel textfield and metho for throw error 
extension LoginVC {
    
    func userEmail() -> String {
        
        let indexPathForUserID = IndexPath(row: 0, section: 0)
        let userIDCell = tableView.cellForRow(at: indexPathForUserID) as! LoginCell
        return userIDCell.loginInputTextField.text!
    }
    
    func userPassword() -> String {
        
        let indexPathForPassword = IndexPath(row: 1, section: 0)
        let passwordCell = tableView.cellForRow(at: indexPathForPassword) as! LoginCell
        return passwordCell.loginInputTextField.text!
    }
    
    
     func showLoginErrorAlert() {
        
        let AlertController = UIAlertController(title: "Login Error!", message: "“Unable to retrieve data at this time, please try again after sometime”", preferredStyle: .alert)
        
        AlertController.addAction(UIAlertAction(title: "Okay", style: .default))
        self.present(AlertController, animated: true)
    }
    
}
