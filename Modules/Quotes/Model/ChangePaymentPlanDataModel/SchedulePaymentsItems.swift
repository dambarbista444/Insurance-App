//
//  SchedulePaymentsItems.swift
//  Quotes
//
//  Created by Dambar Bista on 9/22/21.
//

import Foundation

public struct SchedulePaymentItems {
    let scheduleDate: String
    let paymentSchedule: String
}


public struct SchdulePaymentData {
    let rowOne: SchedulePaymentItems?
    let rowTwo: SchedulePaymentItems?
    let rowThree: SchedulePaymentItems?
}
