//
//  SchedulePaymentDataProvider.swift
//  Quotes
//
//  Created by Dambar Bista on 9/22/21.
//

import Foundation

public protocol SchedulePaymentDataProviderConfigurable {
    
    var shcedulePaymentData: SchdulePaymentData? { get }
    func loadschedulePaymentData() -> SchdulePaymentData?
    
}

public class SchedulePaymentDataProvider: SchedulePaymentDataProviderConfigurable {
    
    public var shcedulePaymentData: SchdulePaymentData?
    
    public static let shared = SchedulePaymentDataProvider()
    
    public func loadschedulePaymentData() -> SchdulePaymentData? {
        
        let rowOne = SchedulePaymentItems(scheduleDate: "October 13, 2021", paymentSchedule: "$137.28")
        let rowTwo = SchedulePaymentItems(scheduleDate: "November 13, 2021", paymentSchedule: "$137.28")
        let rowThree = SchedulePaymentItems(scheduleDate: "December 13, 2021", paymentSchedule: "$137.28")
        
        shcedulePaymentData = SchdulePaymentData(rowOne: rowOne, rowTwo: rowTwo, rowThree: rowThree)

        return shcedulePaymentData
    }
}

