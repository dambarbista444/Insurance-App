//
//  ViewController.swift
//  InsuranceApp
//
//  Created by Subrahmanya Kasanna on 8/9/21.
//

import UIKit
import SnapKit
import PromiseKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    lazy var box = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        testPods()
    }

    func testPods() {
        // SnapKit
        self.view.addSubview(box)
        box.backgroundColor = .blue
        box.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(50)
            make.center.equalTo(self.view)
        }
        
        // Alamofire, PromiseKit, SwiftyJSON
        getUserInfo()
            .done { json -> Void in
                // Do something with the JSON info
                let value = JSON(json)
                debugPrint(value.dictionaryValue)
            }
            .catch { error in
                // Handle error or give feedback to the user
                debugPrint(error.localizedDescription)
            }
    }
}

extension ViewController {
    func getUserInfo() -> Promise<[String: Any]> {
        return Promise { seal in
            AF.request("https://jsonplaceholder.typicode.com/users/1")
                .validate()
                .responseJSON { response in
                    
                    switch response.result {
                    case .success(let json):
                        guard let json = json  as? [String: Any] else {
                            return seal.reject(AFError.responseValidationFailed(reason: .dataFileNil))
                        }
                        seal.fulfill(json)
                    case .failure(let error):
                        seal.reject(error)
                    }
                }
        }
    }
}

