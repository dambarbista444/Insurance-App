//
//  PolicyDataProvider.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 9/4/21.
//

import Foundation
import UIKit

public protocol PolicyDataProviderConfigurable {
    
    var policyData: PolicyData? {get}
    
    func loadPolicyData() -> PolicyData?
}


public class PolicyDataProvider: PolicyDataProviderConfigurable {
    
    public var policyData: PolicyData?
    
    public static let shared = PolicyDataProvider()
    
    public func loadPolicyData() -> PolicyData? {
        
        // MARK:- Auto Cell
        let autoOneItems = AutoItems(vehicleName: "2012 Nissan Altima", vehicleImage: UIImage(named: "vehicleImg.jpeg")!, billingDate: "Next Billing Date: 08/24/2021", forwardArrowImage: UIImage(systemName: "chevron.forward")!)
        
        let autoTwoItems = AutoItems(vehicleName: "1950 BMW", vehicleImage: UIImage(named: "vehicleImg.jpeg")!, billingDate: "Next Billing Date: 08/24/2021", forwardArrowImage: UIImage(systemName: "chevron.forward")!)
        
        
        
        // MARK:- Home and rental cell
        
        let homeAndRentalItems = HomeAndRentalItems(streetName: "7000 Christopher Dr", homeType: "Rental", policyEndDate: "Policy End Date: 09/13/2021", forwardArrowImage: UIImage(systemName: "chevron.forward")!)
        
        // MARK:- Documents Cell
        let auto = DocumentsItems(documentsItems: "Auto", arrowImage: UIImage(systemName: "chevron.forward")!)
        let life = DocumentsItems(documentsItems: "Life", arrowImage: UIImage(systemName: "chevron.forward")!)
        let house = DocumentsItems(documentsItems: "House", arrowImage: UIImage(systemName: "chevron.forward")!)
        
        
        policyData = PolicyData(autoOneItems: autoOneItems, autoTwoItems: autoTwoItems, homeAndRentalItems: homeAndRentalItems, auto: auto, life: life, house: house)
        
        return policyData
    }
}

