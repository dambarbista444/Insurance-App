//
//  PersonModelNetworkManager.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 8/21/21.
//

import Foundation
import Alamofire
import SwiftyJSON
import PromiseKit

public struct PersonModelNetworkManager {
    public init() {} // making this accesable by other methods/files
    
   public func fetchPersonDetails(completionHandler: @escaping (PersonResult) ->Void)  -> Promise<PersonResult> {
        
        let url = "https://randomuser.me/api/?exc=login,dob,registered,gender,nat,cell,timezone&noinfo"
        
        return Promise { seal in
            
            let request = AF.request(url).responseJSON { (response) in
                
                switch response.result {
                case .success(let value):
                    
                    let json = JSON(value)
                    let result = PersonResult(json: json)
                    
                    completionHandler(result)
                    seal.fulfill(result)
                    
                case .failure(let error):
                    seal.reject(error)
                }
            }
            request.validate()
        }
    }
}


