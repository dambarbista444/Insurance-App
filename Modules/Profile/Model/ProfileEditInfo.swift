//
//  ProfileEditInfo.swift
//  Profile
//
//  Created by Dambar Bista on 9/2/21.
//

import Foundation

struct ProfileEditItems {
    var personalInfo: String
    
}

struct ProfileModelsData {
    
    static var personalInfos = [
        
        ProfileEditItems(personalInfo: "Phone:"),
        ProfileEditItems(personalInfo: "Email:" ),
        ProfileEditItems(personalInfo: "Streed Add:"),
        ProfileEditItems(personalInfo: "Apt/Suite:"),
        ProfileEditItems(personalInfo: "City:"),
        ProfileEditItems(personalInfo: "Zip:"),
        ProfileEditItems(personalInfo: "Country:")
    ]
    
    static func getProfileInfo( for index: Int) -> String {
        return personalInfos[index].personalInfo
    }
}

