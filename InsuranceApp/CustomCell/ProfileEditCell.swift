//
//  ProfileEditCell.swift
//  iOSTrainingProject2 - Dambar
//
//  Created by Dambar Bista on 8/17/21.
//

import UIKit

class ProfileEditCell: UITableViewCell {
    
    
    let personalInfoTextField = UITextField()
    let personalInfoNames = UILabel()
    
    
    lazy var userIDStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .top
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        [self.personalInfoNames,self.personalInfoTextField].forEach {
            stackView.addArrangedSubview($0)

        }
        
        return stackView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let mainView = UIView() // This view is for add stackViews as subviews
        
        addViews(view: mainView)
        configureTheItemsFromExtensions()
        setUpConstraints(for: mainView)
    }
   
    
    private func addViews(view: UIView) {
    
        view.addSubview(userIDStackView)
        contentView.addSubview(view)
    }
    
    
    private func configureTheItemsFromExtensions() {
       
        personalInfoNames.setUpLabel(text: "", textAlignment: .left, heightConstant: 40, widthConstant: 100, fontSize: 18)
        personalInfoTextField.setUpTextField(placeholder: "", heightConstant: 40, widthConstant: 250)
        
    }
    
    
    private func setUpConstraints(for view: UIView) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
