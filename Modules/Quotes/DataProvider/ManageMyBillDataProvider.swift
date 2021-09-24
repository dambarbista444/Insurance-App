//
//  ManageMyBillDataProvider.swift
//  Quotes
//
//  Created by Dambar Bista on 9/21/21.
//

import Foundation


public protocol ManageMyBillDataProviderConfigurable {
    
    var manageMyBillData: ManageMyBillData? { get }
    func loadManageMyBillData() -> ManageMyBillData?
    
}

class ManageMyBillDataProvider: ManageMyBillDataProviderConfigurable {
    
    var manageMyBillData: ManageMyBillData?
    
    public static let shared = ManageMyBillDataProvider()
    
    func loadManageMyBillData() -> ManageMyBillData? {
        
        
        let firstRowItem = ManageMyBillItems(billingScheduleText: "Billing Schedule", paymentScheduleText: "Payment Schedule", buttonTitleText: "View")
        
        let secondRowItem = ManageMyBillItems(billingScheduleText: "Current Payment Plan", paymentScheduleText: "6p TMPP", buttonTitleText: "Edit")
        
        let thirdRowItem = ManageMyBillItems(billingScheduleText: "Paperless Billing", paymentScheduleText: "Enrolled", buttonTitleText: "Edit")
        
        manageMyBillData = ManageMyBillData(firstRowItem: firstRowItem, secondRowItem: secondRowItem, thirdRowItem: thirdRowItem)
        
        return manageMyBillData
    }
    
    
    
}
