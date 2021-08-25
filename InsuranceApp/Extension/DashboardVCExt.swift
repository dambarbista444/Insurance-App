//
//  DashboardVCExt.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 8/23/21.
//

import Foundation
import SnapKit


extension DashboardVC {
    
    func setUpConstraints() {
        
        tableView.snp.makeConstraints { make in
            
            make.top.equalTo(navigationBar.snp.bottom).offset(20)
            make.left.equalTo(view.snp.left).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
}
