//
//  LoginModel.swift
//  iOSTrainingProject2 - Dambar
//
//  Created by Dambar Bista on 8/15/21.
//

import Foundation
import UIKit

struct ProfileEditItems {
    var personalInfo: String
    static let states = ["Pennsylvania", "New York", "Washington"]
}

struct ProfileModelsData {
    
    static var personalInfos = [
          
          ProfileEditItems(personalInfo: "Phone:"),
          ProfileEditItems(personalInfo: "Email:" ),
          ProfileEditItems(personalInfo: "Streed Add:"),
          ProfileEditItems(personalInfo: "Apt/Suite:"),
          ProfileEditItems(personalInfo: "City:"),
          ProfileEditItems(personalInfo: "Zip:")
    ]
    
    static func getProfileInfo( for index: Int) -> String {
        return personalInfos[index].personalInfo
    }
}
