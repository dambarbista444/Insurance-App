//
//  LoginVCTests.swift
//  InsuranceAppTests
//
//  Created by Dambar Bista on 9/9/21.
//

import XCTest
import PromiseKit
@testable import InsuranceApp

class LoginVCTests: XCTestCase {
    
    let loginVC = LoginVC()
   
    
    func test_titleLabel_with_titleText() {
        
        let buttonTitle = loginVC.titleLabel.text
        let titleText = "LOGIN"
        XCTAssertEqual(buttonTitle, titleText)
    }
    
    
    func test_signInButtonTitle_with_titleText() {
        
        let buttonTitle = loginVC.signInButton.currentTitle
        let titleText = "SIGN IN"
        XCTAssertEqual(buttonTitle, titleText)
    }
    
  
    func test_getUserEmail_with_userIDCell() {
        
        let indexPathForUserID = IndexPath(row: 0, section: 0)
        guard let userIDCell = loginVC.tableView.cellForRow(at: indexPathForUserID) as? LoginCell else { return }
        let userEmail = loginVC.getUserEmail()
        
        XCTAssertEqual(userEmail, userIDCell.loginTextField.text)
    }
    
    
    func test_getUserPassword_with_userPasswordCell() {
        
        let indexPathForPassword = IndexPath(row: 1, section: 0)
        guard let passwordCell = loginVC.tableView.cellForRow(at: indexPathForPassword) as? LoginCell else { return }
        let userPassword = loginVC.getUserPassword()
        
        XCTAssertEqual(userPassword, passwordCell.loginTextField.text)
    }
    
    
    func test_NumberOfSections_with_section_Returns_section() {
        let numberOfSections = loginVC.numberOfSections(in: loginVC.tableView)
        
        XCTAssertEqual(numberOfSections, 1)
    }
    
    
    
    func test_LoginNetworkManager_with_validRequest_Returns_LoginResponse() {
        
        let loginNetworkManager = LoginNetworkManager()
        let login = Login(email: "eve.holt@reqres.in", password: "Abc123")
        let expectation = self.expectation(description: "validRequest_Returns_LoginResponse")
        
        let request = loginNetworkManager.requestLoginValidation(with: login)
        
        /// Make this work
        
        expectation.fulfill()
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    

   

}


//
//switch request.result {
//case let .fulfilled(x):
////           XCTAssertTrue(request.isFulfilled)
//    XCTAssertEqual(login.email, x.email)
//default:
//    print("")
//}
//
//
////            .done { login in
////                XCTAssertFalse(request.isRejected)
////
////            }.catch { error in
////                //
////            }
