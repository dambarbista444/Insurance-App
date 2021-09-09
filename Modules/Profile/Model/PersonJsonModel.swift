//
//  PersonModel.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 8/21/21.
//

import Foundation
import SwiftyJSON


public struct PersonResult {
    let name: Name
    let location: Location
    let email: String
    let phone: String
    let id: ID
    let picture: Picture
    
    init(json: JSON) {
        
        self.name =  Name(json: json["results"][0]["name"])
        self.location = Location(json: json["results"][0]["location"])
        self.email = json["results"][0]["email"].stringValue
        self.phone = json["results"][0]["phone"].stringValue
        self.id  = ID(json: json["results"][0]["id"])
        self.picture = Picture(json: json["results"][0]["picture"])
    }
}

struct Name {
    let first: String
    let last: String
    
    init(json: JSON) {
        self.first = json["first"].stringValue
        self.last = json["last"].stringValue
    }
}

struct Location {
    let street: Street
    let city: String
    let country: String
    let postcode: Int
    
    init(json: JSON) {
        
        self.street = Street(json: json["street"])
        self.city = json["city"].stringValue
        self.postcode = json["postcode"].intValue
        self.country = json["country"].stringValue
    }
}

struct Street {
    let number: Int
    let name: String
    
    init(json: JSON) {
        self.number = json["number"].intValue
        self.name = json["name"].stringValue
        
    }
}

struct ID {
    let value: String
    
    init(json: JSON) {
        
        self.value = json["value"].stringValue
    }
}

struct Picture {
    let medium: String
    
    init(json: JSON) {
        self.medium = json["medium"].stringValue
    }
}





