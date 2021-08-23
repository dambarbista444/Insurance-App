//
//  ProfileVCExt.swift
//  iOSTrainingProject2 - Dambar
//
//  Created by Dambar Bista on 8/16/21.
//

import Foundation
import UIKit

var loadingView: UIView?
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
    
    
    func createSectionViewsForStates(sectionTitle: String, sectionView: UIView, selectStateLabel: UILabel, dropDownBtn: UIButton) -> UIView {
        
        let sectionViewWidth = self.view.frame.size.width
        sectionView.frame = CGRect(x: 0, y: 0, width: sectionViewWidth, height: 50)
        
        let sectionLabel = UILabel(frame: CGRect(x: 20, y: 0, width: 100, height: 30))
        sectionLabel.text = sectionTitle
        
        selectStateLabel.frame = CGRect(x: Int(sectionLabel.frame.size.width + 120), y: 0, width: 150, height: 20)
        selectStateLabel.text = selectStateLabel.text
        selectStateLabel.font = .boldSystemFont(ofSize: 18)
        
        dropDownBtn.frame = CGRect(x: Int(sectionLabel.frame.size.width + 228), y: 0, width: 40, height: 20)
        dropDownBtn.setBackgroundImage(UIImage(systemName: "chevron.down"), for: .normal)
        
        sectionView.addSubview(selectStateLabel)
        sectionView.addSubview(sectionLabel)
        sectionView.addSubview(dropDownBtn)
        
        return sectionView
    }
    
    /// These belows methods for loading indicator for show and remoing
    func showLoadingSpinner(on view: UIView) {
        
        let spinnerView = UIView.init(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        spinnerView.backgroundColor = UIColor(red: 0.75, green: 0.92, blue: 0.96, alpha: 1.0)
        let activityIndicator = UIActivityIndicatorView.init(style: .large)
        activityIndicator.startAnimating()
        activityIndicator.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(activityIndicator)
            view.addSubview(spinnerView)
        }
        
        loadingView = spinnerView
    }
    
    
    func removeLoadingSpinner() {
        
        DispatchQueue.main.async {
            loadingView?.removeFromSuperview()
            loadingView = nil
        }
    }
    
}
