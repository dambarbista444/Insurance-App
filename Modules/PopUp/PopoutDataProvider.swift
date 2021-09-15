//
//  PopoutDataProvider.swift
//  PopUp
//
//  Created by Dambar Bista on 9/14/21.
//

import Foundation

public protocol PopoutDataProviderConfigurable {
    
    var popoutData: PopoutData? { get }
    func loadPopoutData() -> PopoutData?
    
}


public class PopoutDataProvider: PopoutDataProviderConfigurable {
    
    public var popoutData: PopoutData?
    public static let shared = PopoutDataProvider()
    
    
    public func loadPopoutData() -> PopoutData? {
        let vehicleDetails = VehicleInsuranceQuotesDetails(title: "What are auto insurance quotes for car insurance?", insuraceDetails: "helllo worldLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.helllo worldLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.helllo worldLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.labore et dolore magna aliqua aliqe...")
        
        popoutData = PopoutData(vehicleInsuraceDetails: vehicleDetails)
        
        return popoutData
    }
    
    
}
