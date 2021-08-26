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
    
    let logoImageView = UIImageView()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "LOGIN"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    //use stack view on this
    private func addViews() {
        
        self.view.addSubview(loginStackView)
    }
    
    
    lazy var loginStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        
        [self.titleLabel,self.logoImageView, self.tableView, self.signInButton].forEach {
            stackView.addArrangedSubview($0)
            
        }
        
        return stackView
    }()
  
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
    // Pulling the login cell rows textfields data to validate the userID and password
    //give name login
    @objc private func validateLoginAndNavigate() {
        

//        let loginNewrok = LoginNetworkManager()
//        let personModelNetworkManager = PersonModelNetworkManager()
//        let stateNetwork = StateNetworkManager()
//        let login =  Login(email: userEmail(), password: userPassword())
//
//        loginNewrok.fetchRequest(login: login)
//            .done { login in
//
//                let tabBarController = TabBarController()
//                tabBarController.showLoadingSpinner(on: tabBarController.view)  // turn on loading spinner
//                self.present(tabBarController, animated: true)
//
//
//                firstly {
//                    when(fulfilled: personModelNetworkManager.fetchPersonDetails(completionHandler: { personDetails in
//                        /// nothing do with closure for now  i wanted to make it optional closure so i could set it nil  and make it clean but in mean time i couldn't do that
//                    }),
//                    stateNetwork.fetchStateData(completaion: { stateDetails in
//                        /// nothing do with closure for now  i wanted to make it optional closure so i could set it nil  and make it clean but in mean time i couldn't do that
//                    }))
//                    .done { personReult in
//                        let tabBarController = TabBarController() // remove loading spinner
//                        tabBarController.removeLoadingSpinner()
//                    }
//                } .catch { error in
//                    /// nothing catch for now
//                }
//            } .catch { [self] error in
//                showLoginErrorAlert()
//            }
        
        let tabBarController = TabBarController()
        tabBarController.modalPresentationStyle = .fullScreen
        self .navigationController?.pushViewController(tabBarController, animated: true)
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


