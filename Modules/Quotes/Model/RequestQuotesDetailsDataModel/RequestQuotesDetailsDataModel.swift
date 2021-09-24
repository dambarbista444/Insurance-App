//
//  MangeMyBillData.swift
//  Quotes
//
//  Created by Dambar Bista on 9/21/21.
//

import Foundation

public struct ManageMyBillItems {
    let billingScheduleText: String
    let paymentScheduleText: String
    let buttonTitleText: String
}


public struct ManageMyBillData {
    let firstRowItem: ManageMyBillItems?
    let secondRowItem: ManageMyBillItems?
    let thirdRowItem: ManageMyBillItems?
}


enum Section: Int {
    case estimateQuotesPriceSection = 0
    case updatePaymentSection = 1
    case makeAPaymentSection = 2
    case paymentPlanSection = 3
}
