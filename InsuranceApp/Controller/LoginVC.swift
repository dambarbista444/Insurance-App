//
//  ViewController.swift
//  iOSTrainingProject2 - Dambar
//
//  Created by Dambar Bista on 8/13/21.
//

import UIKit
import Alamofire
import PromiseKit

class LoginVC: UIViewController {
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "LOGIN"
        label.font = .boldSystemFont(ofSize: 20)
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
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        addViews()
        setUpConstrints()
    }
    
    
    private func addViews() {
        self.view.addSubview(titleLabel)
        self.view.addSubview(tableView)
        self.view.addSubview(logoImageView)
        self.view.addSubview(signInButton)
    }
    
    
    // Pulling the login cell rows textfields data to validate the userID and password
    @objc private func validateLoginAndNavigate() {
        
        let loginNewrok = LoginNetworkManager()
        let profileVC = ProfileVC()
        let login =  Login(email: userEmail(), password: userPassword())
        
        
        let personModelNetworkManager = PersonModelNetworkManager()
        let stateNetwork = StateNetworkManager()
        
        
        loginNewrok.fetchRequest(login: login)
            .done { login in
                
                self.present(profileVC, animated: true)
                profileVC.showLoadingSpinner(on: profileVC.view) // turn on loading spinner
                
                firstly {
                    when(fulfilled: personModelNetworkManager.fetchPersonDetails(completionHandler: { personDetails in
                        /// nothing do with closure for now  i wanted to make it optional closure so i could set it nil  and make it clean but in mean time i couldn't do that
                    }),
                    stateNetwork.fetchStateData(completaion: { stateDetails in
                        /// nothing do with closure for now  i wanted to make it optional closure so i could set it nil  and make it clean but in mean time i couldn't do that 
                    }))
                    .done { personReult in
                        profileVC.removeLoadingSpinner() // remove loading spinner
                        
                    }
                } .catch { error in
                    /// nothing catch for now
                }
            } .catch { [self] error in
                showLoginErrorAlert()
            }
    }
}

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
            loginCell.loginInputTextField.placeholder = " Enter User ID"
        } else {
            
            loginCell.loginInputNames.text = "Password"
            loginCell.loginInputTextField.placeholder = " Enter Password "
        }
        
        return loginCell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}


