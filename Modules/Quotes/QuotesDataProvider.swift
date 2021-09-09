//
//  QuotesDataProvider.swift
//  Quotes
//
//  Created by Dambar Bista on 9/6/21.
//

import Foundation


public protocol QuotesDataProviderConfigurable {
    
    var quotesData: QuotesData? { get }
    
    func loadQuotesData() -> QuotesData?
    
}


public class QuotesDataProvider: QuotesDataProviderConfigurable {
    
    public var quotesData: QuotesData?
    
    public static let shared = QuotesDataProvider()
    
    public func loadQuotesData() -> QuotesData? {
        
        ///My Quotes
        
        let lifeInsuranceOne = MyQuotesItems(quotesItems: "Life insurane 1", arrowImage: UIImage(systemName: "chevron.forward")!)
        
        let lifeInsuranceTwo = MyQuotesItems(quotesItems: "Life insurane 2", arrowImage: UIImage(systemName: "chevron.forward")!)
        
        let vehicleInsurance = MyQuotesItems(quotesItems: "Vehicle insurance", arrowImage: UIImage(systemName: "chevron.forward")!)
        
        quotesData = QuotesData(lifeInsuranceOne: lifeInsuranceOne, lifeInsuranecTwo: lifeInsuranceTwo, vehicleInsurance: vehicleInsurance)
        
        return quotesData
    }
    
    
    
}
