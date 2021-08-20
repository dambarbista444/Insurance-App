//
//  ProfileVCExt.swift
//  iOSTrainingProject2 - Dambar
//
//  Created by Dambar Bista on 8/16/21.
//

import Foundation
import UIKit


extension ProfileVC {
    
    public func setUPConstrints() {
    
        tableView.topAnchor.constraint(equalTo:navigationBar.bottomAnchor ,constant: -20).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: 20).isActive = true
        
        saveButton.topAnchor.constraint(equalTo: tableView.bottomAnchor,constant: -20).isActive = true
        saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -20).isActive = true
    }
}

//Here's in this extension i am creating the sections views for states and country and adding labels and button.
// the useage of button will be drop down the list of states or country rows
extension ProfileVC  {
    
    func createSectionViewForProfileCardAndProfileEdit(title: String) -> UIView {
        
        let headerTitleWidth = self.view.frame.width
        let headerTitleLabel = UILabel(frame: CGRect(x: 0, y: 5, width: headerTitleWidth, height: 20))
        headerTitleLabel.text = title
        headerTitleLabel.font = .boldSystemFont(ofSize: 20)
        headerTitleLabel.textAlignment = .center
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: headerTitleWidth, height: 30))
        headerView.addSubview(headerTitleLabel)
        
        return headerView
    }
    
    
    func createSectionViewsForStatesAndCountry(sectionTitle: String, sectionView: UIView, selectLabel: UILabel, dropDownBtn: UIButton) -> UIView {
        
        let sectionViewWidth = self.view.frame.size.width
        sectionView.frame = CGRect(x: 0, y: 0, width: sectionViewWidth, height: 50)
        
        let sectionLabel = UILabel(frame: CGRect(x: 20, y: 0, width: 100, height: 30))
        sectionLabel.text = sectionTitle
        
        selectLabel.frame = CGRect(x: Int(sectionLabel.frame.size.width + 120), y: 0, width: 150, height: 20)
        selectLabel.text = selectStateLabel.text
        selectLabel.font = .boldSystemFont(ofSize: 18)
        
        dropDownBtn.frame = CGRect(x: Int(sectionLabel.frame.size.width + 228), y: 0, width: 40, height: 20)
        dropDownBtn.setBackgroundImage(UIImage(systemName: "chevron.down"), for: .normal)
    
    
        sectionView.addSubview(selectLabel)
        sectionView.addSubview(sectionLabel)
        sectionView.addSubview(dropDownBtn)
        
        return sectionView
    }
}
