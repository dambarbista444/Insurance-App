//
//  DashboardDataProvider.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 9/6/21.
//

import Foundation
import UIKit


protocol DashboardDataProviderConfigurable {
    
    var dashboardData: DashboardData? {get}
    
    func loadDashboardData() -> DashboardData?
    
}


class DashboardDataProvider: DashboardDataProviderConfigurable {
    
    var dashboardData: DashboardData?
    
    public static let shared = DashboardDataProvider()
    
    func loadDashboardData() -> DashboardData? {
        
        /// Upcoming Bill
        let upcomingBill = UpComingBillItems(status: "Bills Loading...")
        
        /// Report And Request
        let reportService = ReportAndRequestItems(serviceType: "Roadside assistance report", arrowImage: UIImage(systemName: "chevron.forward")!)
        
        let requestService = ReportAndRequestItems(serviceType: "Report accident", arrowImage: UIImage(systemName: "chevron.forward")!)
        
        /// Contact  Agent
        let contactAgent = ContactAgentItems(name: "Joe Biden", email: "joebiden@email.com", phone: "444-555-6666", agentImage: UIImage(named: "agentImg.jpg")!)
        
        dashboardData = DashboardData(upcomingBillItems: upcomingBill, reportItems: reportService, requestItems: requestService, contactAgentItems: contactAgent)
        
        return dashboardData
    }
    
    
    
}
