//
//  LoginVCItemsConstraints.swift
//  iOSTrainingProject2 - Dambar
//
//  Created by Dambar Bista on 8/14/21.
//

import Foundation
import UIKit

extension LoginVC {
    
    public func setUpConstrints() {
        
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 30).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        logoImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 20).isActive = true
        logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        tableView.topAnchor.constraint(equalTo:logoImageView.bottomAnchor ,constant: 20).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 110).isActive = true
        
        signInErrorMessageLabel.topAnchor.constraint(equalTo: tableView.bottomAnchor,constant: 20 ).isActive = true
        signInErrorMessageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        signInErrorMessageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        signInErrorMessageLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        signInButton.topAnchor.constraint(equalTo: signInErrorMessageLabel.bottomAnchor,constant: 20).isActive = true
        signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        signInButton.bottomAnchor.constraint(equalTo: signInButton.bottomAnchor).isActive = true
    }
    
}




