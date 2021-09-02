//
//  StateNetworkManager.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 8/22/21.
//

import Foundation
import Alamofire
import SwiftyJSON
import PromiseKit

public struct StateNetworkManager  {
    public init() {}
    
    func fetchStateData(completaion: @escaping ([String]) -> Void) ->Promise<[String]> {
        
        return Promise { seal in
            
            let stateUrl = "https://datausa.io/api/data?drilldowns=State&measures=Population&limit=5"
            
            AF.request(stateUrl, method: .get)
                .validate()
                .response { response in
                    
                    switch response.result {
                    
                    case .success(let value):
                        
                        let json = JSON(value!)
                        let results = json["data"].arrayValue.map{$0 ["State"].stringValue}
                        var statesModel = [String]()
                        
                        for state in results {
                            statesModel.append(state)
                        }
                        
                        completaion(statesModel)
                        seal.fulfill(statesModel)
                        
                    case .failure(let error):
                        seal.reject(error)
                    }
                }
        }
    }
}
