//
//  ViewController.swift
//  iOSTrainingProject2 - Dambar
//
//  Created by Dambar Bista on 8/13/21.
//

import UIKit
import Alamofire
import PromiseKit
import SnapKit

class LoginVC: UIViewController, UITextFieldDelegate {
    
    
    // MARK:- Properties
    private let logoImageView = UIImageView()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "LOGIN"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let tableView: UITableView = {
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
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var loginStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        
        [self.titleLabel,self.logoImageView, self.tableView, self.signInButton].forEach {
            stackView.addArrangedSubview($0)
            
        }
        
        return stackView
    }()
    
    
    private let loginViewModel = LoginViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        addViews()
        setUpConstrints()
        configureItemsFromExtesion()
        navigationController?.isNavigationBarHidden = true
        
        /// Receiving notification to move up the login stack view by updating bottom constraint
        NotificationCenter.default.addObserver(self, selector: #selector(moveloginStackViewUpward(_:)), name: Notification.Name(rawValue: "moveloginStackViewUpward"), object: nil)
    }
    
    // MARK:- Add Views
    
    private func addViews() {
        
        self.view.addSubview(loginStackView)
    }
    
    
    /// When user touch the loging textfield
    @objc func moveloginStackViewUpward(_ notification: Notification) {
        
        loginStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(view.snp.left).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-250)
        }
    }
    
    
    
    private func configureItemsFromExtesion() {
        logoImageView.reuseableImageView(image: UIImage(named: "pncLogo.jpeg")!)
        
    }
    
    
    func getUserEmail() -> String {
        
        let indexPathForUserID = IndexPath(row: 0, section: 0)
        let userIDCell = tableView.cellForRow(at: indexPathForUserID) as! LoginCell
        return userIDCell.loginTextField.text ?? "no input"
    }
    
    
    func getUserPassword() -> String {
        
        let indexPathForPassword = IndexPath(row: 1, section: 0)
        let passwordCell = tableView.cellForRow(at: indexPathForPassword) as! LoginCell
        return passwordCell.loginTextField.text ?? "no input"
    }
    
    /// Login Action
    @objc private func login() {
        
        //loginViewModel.login(with: getUserEmail(), and: getUserPassword(), showLoginErrorMessageAt: self)
        
        // MARK:- This below codes are just use to navigate to second screen without entering email and password everytime while working.
        let tabBarController = TabBarController()
        tabBarController.modalPresentationStyle = .fullScreen
        self .navigationController?.pushViewController(tabBarController, animated: true)
    }
}


// MARK:- TableView DataSource And Delegate

extension LoginVC:  UITableViewDataSource, UITableViewDelegate {
    
    
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
            loginCell.loginTextField.placeholder = " Enter User ID"
        } else {
            
            loginCell.loginInputNames.text = "Password"
            loginCell.loginTextField.placeholder = " Enter Password "
        }
        
        return loginCell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}


// MARK:- Constraints

extension LoginVC  {
    
    func setUpConstrints() {
        
        loginStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(view.snp.left).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-100)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
        
        logoImageView.snp.makeConstraints { make in
            
            make.height.equalTo(200)
        }
        
        
        tableView.snp.makeConstraints { make in
            make.left.equalTo(loginStackView.snp.left)
            make.right.equalTo(loginStackView.snp.right)
            make.height.equalTo(110)
        }
        
        
        signInButton.snp.makeConstraints { make in
            make.left.equalTo(loginStackView.snp.left)
            make.right.equalTo(loginStackView.snp.right)
            make.height.equalTo(40)
        }
        
    }
    
}



