//
//  ChangeMyPlanViewModel.swift
//  Quotes
//
//  Created by Dambar Bista on 9/22/21.
//

import Foundation

public protocol ChangePaymentPlanViewConfigurable {
    
    var numberOfSections: Int { get }
    var titileForSections: [String] { get }
    var paymentPlanItems: [String] { get }
    
    func numberOfRowsPerSection(section: Int) -> Int
    func heightForRowAt(indexPath: IndexPath) -> Int
    func row(for indexPath: IndexPath) -> ChangePaymentPlanRow?
}

extension ChangePaymentPlanViewConfigurable {
    
    public var titileForSections: [String] {
        let titles = ["Select a New Payment Plan", "Scheduled Payments"]
        return titles
    }
    
    public var paymentPlanItems: [String] {
        let items = ["Pay in Full", "2 Payments - 50% Down Payment", "3 Payments - 40% Down Payment", "4 Payments - 25% Down Payment", "5 Payments - 20% Down Payment", "True Monthly - 6 Payments with GEICO"]
        return items
    }
}


public class ChangePaymentPlanViewModel: ChangePaymentPlanViewConfigurable {
    
    var sections = [ChangePaymentPlanSection]()
    private var dataProvider: SchedulePaymentDataProvider
    
    public init(dataProvider: SchedulePaymentDataProvider = SchedulePaymentDataProvider.shared ) {
        self.dataProvider = dataProvider
        configureSection()
    }
    
    
    func configureSection() {
        /// For now i am using this to get number of rows and secton withing passing data from data provider for New payment plan Section

        var newPaymentPlanRows = [ChangePaymentPlanRow]()
        var schedulePaymentRows = [ChangePaymentPlanRow]()
        let schedulePaymentData = dataProvider.loadschedulePaymentData()
            /// New payment plan Section
        newPaymentPlanRows.append(ChangePaymentPlanRow.newPaymentPlanRow(SelectNewPaymentPlanTableViewCellViewModel()))
        newPaymentPlanRows.append(ChangePaymentPlanRow.newPaymentPlanRow(SelectNewPaymentPlanTableViewCellViewModel()))
        newPaymentPlanRows.append(ChangePaymentPlanRow.newPaymentPlanRow(SelectNewPaymentPlanTableViewCellViewModel()))
        newPaymentPlanRows.append(ChangePaymentPlanRow.newPaymentPlanRow(SelectNewPaymentPlanTableViewCellViewModel()))
        newPaymentPlanRows.append(ChangePaymentPlanRow.newPaymentPlanRow(SelectNewPaymentPlanTableViewCellViewModel()))
        newPaymentPlanRows.append(ChangePaymentPlanRow.newPaymentPlanRow(SelectNewPaymentPlanTableViewCellViewModel()))
        
        /// Schedule Payments Section
        if let rowOne = schedulePaymentData?.rowOne {
            schedulePaymentRows.append(ChangePaymentPlanRow.schedulePaymentRow(SchedulePaymentsTableViewCellViewModel(schedulePaymentItems: rowOne)))
        }
        
        if let rowTwo = schedulePaymentData?.rowTwo {
            schedulePaymentRows.append(ChangePaymentPlanRow.schedulePaymentRow(SchedulePaymentsTableViewCellViewModel(schedulePaymentItems: rowTwo)))
        }
        
        if let rowThree = schedulePaymentData?.rowThree {
            schedulePaymentRows.append(ChangePaymentPlanRow.schedulePaymentRow(SchedulePaymentsTableViewCellViewModel(schedulePaymentItems: rowThree)))
        }
        
        /// Section
        sections.append(ChangePaymentPlanSection.newPaymentPlanSection(newPaymentPlanRows))
        sections.append(ChangePaymentPlanSection.schedulePaymentSection(schedulePaymentRows))
        
    }
}

extension ChangePaymentPlanViewModel {
    
    public var numberOfSections: Int {
        return sections.count
    }

    public func numberOfRowsPerSection(section: Int) -> Int {
        return sections[section].numberOfRows()
    }

    public func heightForRowAt(indexPath: IndexPath) -> Int {
        return sections[indexPath.section].height(for: indexPath)
    }

    public func row(for indexPath: IndexPath) -> ChangePaymentPlanRow? {
        return sections[indexPath.section].row(for: indexPath)
    }

}


public enum ChangePaymentPlanRow {
    case newPaymentPlanRow(SelectNewPaymentPlanTableViewCellConfigurable)
    case schedulePaymentRow(SchedulePaymentsTableViewCellViewConfigurable)
}


enum ChangePaymentPlanSection {
    case newPaymentPlanSection([ChangePaymentPlanRow])
    case schedulePaymentSection([ChangePaymentPlanRow])
    
    
    func numberOfRows() -> Int {

        switch self {
        case let .newPaymentPlanSection(rows):
            return rows.count
            
        case let .schedulePaymentSection(rows):
            return rows.count
        }
    }
    
    
    func row(for indexPath: IndexPath) -> ChangePaymentPlanRow? {

        switch self {
        case let .newPaymentPlanSection(rows):
            return rows[indexPath.row]

        case let .schedulePaymentSection(rows):
            return rows[indexPath.row]
        }
    }
    
    func height(for indexPath: IndexPath) -> Int {
        switch self {
        case .newPaymentPlanSection(_):
            return 60
        case .schedulePaymentSection(_):
            return 60
        }
    }
    
   
}

