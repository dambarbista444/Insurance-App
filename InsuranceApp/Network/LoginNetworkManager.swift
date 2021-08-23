//
//  LoginNetworkManager.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 8/20/21.
//

import Foundation
import Alamofire
import UIKit
import PromiseKit


struct LoginNetworkManager {
    
    private let loginUrl = "https://reqres.in/api/login"
    
    func fetchRequest(login: Login) -> Promise<Login> {
        
        return Promise { seal  in
            
            let request = AF.request(loginUrl, method: .post, parameters: login, encoder: JSONParameterEncoder.default).response  { response in
                
                switch response.result {
                case .success:
                    seal.fulfill(login)
                    
                case .failure(let error):
                    seal.reject(error)
                }
            }
            request.validate()
        }
    }
}
