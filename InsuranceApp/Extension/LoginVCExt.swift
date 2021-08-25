//
//  LoginVCItemsConstraints.swift
//  iOSTrainingProject2 - Dambar
//
//  Created by Dambar Bista on 8/14/21.
//

import Foundation
import UIKit
import SnapKit

extension LoginVC {
    
    public func setUpConstrints() {
        
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20.0)
            make.left.equalTo(view.snp.left).offset(20.0)
            make.right.equalTo(view.snp.right).offset(-20.0)
            make.height.equalTo(30)
        }
        
        
        logoImageView.snp.makeConstraints { make in
            
            make.top.equalTo(titleLabel.snp.bottom).offset(20.0)
            make.left.equalTo(view.snp.left).offset(20.0)
            make.right.equalTo(view.snp.right).offset(-20.0)
            make.bottom.equalTo(tableView.snp.top).offset(-20)
        }
        
        
        tableView.snp.makeConstraints { make in
            
            make.top.equalTo(logoImageView.snp.bottom).offset(20.0)
            make.left.equalTo(view.snp.left).offset(20.0)
            make.right.equalTo(view.snp.right).offset(-20.0)
            make.height.equalTo(110)
        }
        
        
        signInButton.snp.makeConstraints { make in
            
            make.top.equalTo(tableView.snp.bottom).offset(100)
            make.left.equalTo(view.snp.left).offset(20.0)
            make.right.equalTo(view.snp.right).offset(-20.0)
            make.height.equalTo(40)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-100)
        }
    }
    
}


// This part will get user email and password from  login tableviewCel textfield and metho for throw error
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





