//
//  DashboardTVCellModel.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 9/6/21.
//

import Foundation
import UIKit

struct UpComingBillItems {
    let status: String
}


struct ReportAndRequestItems {
    let serviceType: String // report or request
    let arrowImage: UIImage
}


struct ContactAgentItems {
    let name: String
    let email: String
    let phone: String
    let agentImage: UIImage
}
