//
//  DashboardViewModel.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 9/6/21.
//

import Foundation


protocol DashboardViewConfigurable {
    
    var numberOfSections: Int {get}
    var titleForHeaderInSection: [String] {get}
    
    func numberOfRowsPerSection(section: Int) -> Int
    func row(for indexPath: IndexPath) -> DashboardRow?
    func heightForRowAt(indexPath: IndexPath) -> Int
}

extension DashboardViewConfigurable {
    
    var titleForHeaderInSection: [String] {
        let titles = ["Upcoming Bills", "My Cards","Report/Request","Contact Agent"]
        return titles
    }
}


class DashboardViewModel: DashboardViewConfigurable {
    
    private var dataProvider: DashboardDataProviderConfigurable
    var sections =  [DashboardSection]()
    
    init(dataProvider: DashboardDataProviderConfigurable = DashboardDataProvider.shared) {
        self.dataProvider = dataProvider
        configureSection()
    }
    
    
    func configureSection() {
        
        let dashboardData = dataProvider.loadDashboardData()
        var upcomingBillRows = [DashboardRow]()
        var myCardsRows = [DashboardRow]()
        var reportAndRequestRows = [DashboardRow]()
        var contactAgentItemsRows = [DashboardRow]()
        
        /// Upcoming Bills
        if let billItems = dashboardData?.upcomingBillItems {
            upcomingBillRows.append(DashboardRow.upcomingBillRow(UpcomingBillTableViewCellViewModel(billItems: billItems)))
            
            sections.append(DashboardSection.upcomingBillRow(upcomingBillRows))
        }
        
        /// My Cards
        myCardsRows.append(DashboardRow.myCardsRow(MyCardsTableViewCellViewModel()))
        sections.append(DashboardSection.myCardsRow(myCardsRows))
        
        /// Report And request
        if let reportItems = dashboardData?.reportItems {
            reportAndRequestRows.append(DashboardRow.reportAndRequestRow(ReportAndRequestTableViewCellViewModel(reportAndRequestItems: reportItems)))
        }
        
        
        if let requestItems = dashboardData?.requestItems {
            reportAndRequestRows.append(DashboardRow.reportAndRequestRow(ReportAndRequestTableViewCellViewModel(reportAndRequestItems: requestItems)))
        }
        
        sections.append(DashboardSection.reportAndRequestRow(reportAndRequestRows))
        
        
        /// Contact Agent
        if let contactAgentItems = dashboardData?.contactAgentItems {
            contactAgentItemsRows.append(DashboardRow.contactAgentRow(ContactAgentTableViewCellViewModel(contactAgentItems: contactAgentItems)))
            
            sections.append(DashboardSection.contactAgentRow(contactAgentItemsRows))
        }
        
        
    }
    
}

extension DashboardViewModel {
    
    var numberOfSections: Int {
        return sections.count
    }
    
    func numberOfRowsPerSection(section: Int) -> Int {
        return sections[section].numberOfRows()
    }
    
    
    func row(for indexPath: IndexPath) -> DashboardRow? {
        return sections[indexPath.section].row(for: indexPath)
    }
    
    
        func heightForRowAt(indexPath: IndexPath) -> Int {
            return sections[indexPath.section].height(for: indexPath)
        }
}


enum DashboardRow {
    case upcomingBillRow(UpcomingBillTableViewCellConfigurable)
    case myCardsRow(MyCardsTableViewCellConfigurable)
    case reportAndRequestRow(ReportAndRequestTableViewCellConfigurable)
    case contactAgentRow(ContactAgentTableViewCellConfigurable)
    
}


enum DashboardSection {
    case upcomingBillRow([DashboardRow])
    case myCardsRow([DashboardRow])
    case reportAndRequestRow([DashboardRow])
    case contactAgentRow([DashboardRow])
    
    
    func numberOfRows() -> Int {
        
        switch self {
        case let .upcomingBillRow(billRows):
            return billRows.count
            
        case let .myCardsRow(myCardsRows):
            return myCardsRows.count
            
        case let .reportAndRequestRow(reportAndRequestRows):
            return reportAndRequestRows.count
            
        case let .contactAgentRow(contactAgentRows):
            return contactAgentRows.count
        }
    }
    
    func row(for indexPath: IndexPath) -> DashboardRow? {
        switch self {
        case let .upcomingBillRow(billRows):
            return billRows[indexPath.row]
            
            
        case let .myCardsRow(myCardsRows):
            return myCardsRows[indexPath.row]
            
        case let .reportAndRequestRow(reportAndRequestRows):
            return reportAndRequestRows[indexPath.row]
            
        case let .contactAgentRow(contactAgentRows):
            return contactAgentRows[indexPath.row]
        }
    }
    
    
    func height(for indexPath: IndexPath) -> Int {
        switch self {
        case .upcomingBillRow(_):
            return 200
            
        case .myCardsRow(_):
            return 260
            
        case .reportAndRequestRow(_):
            return 40
            
        case .contactAgentRow(_):
            return 120
        }
    }
    
}
