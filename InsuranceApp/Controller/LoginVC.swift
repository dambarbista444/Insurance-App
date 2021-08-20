//
//  ViewController.swift
//  iOSTrainingProject2 - Dambar
//
//  Created by Dambar Bista on 8/13/21.
//

import UIKit

class LoginVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "LOGIN"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let signInErrorMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Login Error: Please double check your userID or Password"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pncLogo.jpeg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
     var tableView: UITableView = {
        let table = UITableView()
        table.register(LoginCell.self, forCellReuseIdentifier: "loginCell")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
     let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("SIGN IN", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(validateLoginAndNavigate), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let userID = "1"
    let password = "2"
    

     override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.delegate = self
        tableView.dataSource = self
        addViews()
        setUpConstrints()
        signInErrorMessageLabel.isHidden = true
    }
    
    private func addViews() {
        self.view.addSubview(titleLabel)
        self.view.addSubview(tableView)
        self.view.addSubview(logoImageView)
        self.view.addSubview(signInErrorMessageLabel)
        self.view.addSubview(signInButton)
    }
    
    
    // Pulling the login cell rows textfields data to validate the userID and password
    @objc private func validateLoginAndNavigate() {
        
        let indexPathForUserID = IndexPath(row: 0, section: 0)
        let userIDCell = tableView.cellForRow(at: indexPathForUserID) as! LoginCell

        let indexPathForPassword = IndexPath(row: 1, section: 0)
        let passwordCell = tableView.cellForRow(at: indexPathForPassword) as! LoginCell

        if userIDCell.loginInputTextField.text == userID && passwordCell.loginInputTextField.text == password {
            let profileVC = ProfileVC()
            present(profileVC, animated: true)
            
        } else {
            signInErrorMessageLabel.isHidden = false
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.allowsSelection = false
        tableView.isScrollEnabled = false

        let loginCell = tableView.dequeueReusableCell(withIdentifier: "loginCell",for: indexPath) as! LoginCell
        
        if indexPath.row == 0 {
            loginCell.loginInputNames.text = "User ID"
            loginCell.loginInputTextField.placeholder = "User ID"
        } else {
            
            loginCell.loginInputNames.text = " Password"
            loginCell.loginInputTextField.placeholder = "Password "
        }
        
        return loginCell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    

    
    

    


}

protocol TransferLoginCellData {
    
    func transefer(userID: String, password: String)
}

