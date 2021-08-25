//
//  LoginCell.swift
//  iOSTrainingProject2 - Dambar
//
//  Created by Dambar Bista on 8/13/21.
//

import UIKit
import SnapKit

class LoginCell: UITableViewCell, UITextFieldDelegate {
    
    let loginTextField = UITextField()
    let loginInputNames = UILabel()
    
    lazy var userIDStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .top
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        [self.loginInputNames,self.loginTextField].forEach {
            stackView.addArrangedSubview($0)
            
        }
        
        return stackView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let view = UIView() // This view is for add stackViews as subviews
        
        addViews(view: view)
        configureTheItemsFromExtensions()
        setUpConstraints(for: view)
        loginTextField.addTarget(self, action: #selector(loginTextFieldBeginEdting(_:)), for: .editingDidBegin)
        loginTextField.delegate = self
        
    }
    
    
    private func addViews(view: UIView) {
        
        view.addSubview(userIDStackView)
        contentView.addSubview(view)
    }
    
    
    private func configureTheItemsFromExtensions() {
        
        loginInputNames.reuseableLabel(text: "", textAlignment: .left, heightConstant: 40, widthConstant: 100, fontSize: 18)
        loginTextField.reuseableTextfield(placeholder: "", heightConstant: 40, widthConstant: 250)
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
    
    
    /// Sending the notification to loginVC to make action to moveloginStackViewUpward() method
    @objc func loginTextFieldBeginEdting(_ textField: UITextField) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "moveloginStackViewUpward"),object: nil)
    }
    
    /// closing the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.contentView.endEditing(true)
        return false
    }
    
}





