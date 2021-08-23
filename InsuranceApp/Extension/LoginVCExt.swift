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




