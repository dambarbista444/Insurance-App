//
//  LoginViewModel.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 8/31/21.
//

import Foundation
import PromiseKit


struct LoginViewModel {
    
    
    func login(with email: String, and password: String, showLoginErrorMessageAt loginVC: UIViewController) {
        
        let loginNewrok = LoginNetworkManager()
        let personModelNetworkManager = PersonModelNetworkManager()
        let stateNetwork = StateNetworkManager()
        let login =  Login(email: email, password: password)
        
        loginNewrok.requestLoginValidation(with: login)
            .done { login in
                
                let tabBarController = TabBarController()
                
                tabBarController.modalPresentationStyle = .fullScreen
                loginVC.navigationController?.pushViewController(tabBarController, animated: true)
                
                tabBarController.showLoadingSpinner(on: tabBarController.view)  // turn on loading spinner
                
                firstly {
                    when(fulfilled: personModelNetworkManager.fetchPersonDetails(completionHandler: { personDetails in
                        /// nothing do with closure for now  i wanted to make it optional closure so i could set it nil  and make it clean but in mean time i couldn't do that
                    }),
                    stateNetwork.fetchStateData(completaion: { stateDetails in
                        /// nothing do with closure for now  i wanted to make it optional closure so i could set it nil  and make it clean but in mean time i couldn't do that
                    }))
                    .done { personReult in
                        
                        TabBarController.removeLoadingSpinner()  // remove loading spinner
                    }
                } .catch { error in
                    /// nothing catch for now
                }
            } .catch { error in
                showLoginErrorAlert(on: loginVC)
            }
    }
    
    
    func showLoginErrorAlert(on loginVC: UIViewController) {
        
        let AlertController = UIAlertController(title: "Login Error!", message: "“Unable to retrieve data at this time, please try again after sometime”", preferredStyle: .alert)
        
        AlertController.addAction(UIAlertAction(title: "Okay", style: .default))
        loginVC.present(AlertController, animated: true)
    }
}
