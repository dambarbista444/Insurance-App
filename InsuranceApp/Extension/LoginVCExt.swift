//
//  LoginVCItemsConstraints.swift
//  iOSTrainingProject2 - Dambar
//
//  Created by Dambar Bista on 8/14/21.
//

import Foundation
import UIKit
import SnapKit


// This part will get user email and password from  login tableviewCel textfield and metho for throw error
extension LoginVC {
    
    func userEmail() -> String {
        
        let indexPathForUserID = IndexPath(row: 0, section: 0)
        let userIDCell = tableView.cellForRow(at: indexPathForUserID) as! LoginCell
        return userIDCell.loginTextField.text!
    }
    
    func userPassword() -> String {
        
        let indexPathForPassword = IndexPath(row: 1, section: 0)
        let passwordCell = tableView.cellForRow(at: indexPathForPassword) as! LoginCell
        return passwordCell.loginTextField.text!
    }
    
    
     func showLoginErrorAlert() {
        
        let AlertController = UIAlertController(title: "Login Error!", message: "“Unable to retrieve data at this time, please try again after sometime”", preferredStyle: .alert)
        
        AlertController.addAction(UIAlertAction(title: "Okay", style: .default))
        self.present(AlertController, animated: true)
    }
}





