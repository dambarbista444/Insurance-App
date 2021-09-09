//
//  PolicyViewModel.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 9/4/21.
//

import Foundation

protocol PolicyViewConfigurable {
    
    var numberOfSections: Int {get}
    var titleForHeaderInSection: [String] {get}
    
    func numberOfRowsPerSection(section: Int) -> Int
    func row(for indexPath: IndexPath) -> PolicyRow?
    func heightForRowAt(indexPath: IndexPath) -> Int
}

extension PolicyViewConfigurable {
    
    var titleForHeaderInSection: [String] {
     let titles = ["AUTO", "HOME/RENTAL", "DOCUMENTS" ]
      return titles
    }
}


class PolicyViewModel: PolicyViewConfigurable {
   
    private var dataProvider: PolicyDataProviderConfigurable
    var sections =  [PolicySection]()
    
    init(dataProvider: PolicyDataProviderConfigurable = PolicyDataProvider.shared) {
        self.dataProvider = dataProvider
        configureSection()
    }


    func configureSection() {
      
        let policyData = dataProvider.loadPolicyData()
        var autoRows = [PolicyRow]()
        var homeAndRentalRows = [PolicyRow]()
        var documentsRow = [PolicyRow]()
        
        /// Autol
        if let autoItems = policyData {
            autoRows.append(PolicyRow.autoRow(AutoTableViewCellViewModel(autoItems: autoItems.autoOneItems)))
            autoRows.append(PolicyRow.autoRow(AutoTableViewCellViewModel(autoItems: autoItems.autoTwoItems)))
            
            sections.append(PolicySection.autoSection(autoRows))
        }
        
        /// Homes And  Rental
        if let homeAndRentalItems = policyData?.homeAndRentalItems {
            homeAndRentalRows.append(PolicyRow.homeAndRentalRow(HomeAndRentalTableViewCellViewModel(homeAndRentalItems: homeAndRentalItems)))
            
            sections.append(PolicySection.homeAndRentalSection(homeAndRentalRows))
        }
        
        ///Documents
        if let documents = policyData {
            documentsRow.append(PolicyRow.documentsRow(DocumentsTableViewCellViewModel(documentsItems: documents.auto)))
            documentsRow.append(PolicyRow.documentsRow(DocumentsTableViewCellViewModel(documentsItems: documents.life)))
            documentsRow.append(PolicyRow.documentsRow(DocumentsTableViewCellViewModel(documentsItems: documents.house)))
            
            sections.append(PolicySection.documentsSection(documentsRow))
        }
    }

}

extension PolicyViewModel {
    
    var numberOfSections: Int {
        return sections.count
    }
    
    func numberOfRowsPerSection(section: Int) -> Int {
        return sections[section].numberOfRows()
    }
    
    
    func row(for indexPath: IndexPath) -> PolicyRow? {
        return sections[indexPath.section].row(for: indexPath)
    }
    
    
    func heightForRowAt(indexPath: IndexPath) -> Int {
        return sections[indexPath.section].height(for: indexPath)
    }
}


enum PolicyRow {
    case autoRow(AutoTableViewCellConfigurable)
    case homeAndRentalRow(HomeAndRentalTableViewCellConfigurable)
    case documentsRow(DocumentsTableViewCellConfigurable)
}


enum PolicySection {
    case autoSection([PolicyRow])
    case homeAndRentalSection([PolicyRow])
    case documentsSection([PolicyRow])
    
    func numberOfRows() -> Int {
        
        switch self {
        case let .autoSection(autoInfoRows):
            return autoInfoRows.count
            
        case let .homeAndRentalSection(homeAndRentalRows):
            return homeAndRentalRows.count
            
        case let .documentsSection(documentsRows):
            return documentsRows.count
        }
    }
    
    
    func row(for indexPath: IndexPath) -> PolicyRow? {
        switch self {
        case let .autoSection(autoInfoRows):
            return autoInfoRows[indexPath.row]
            
        case let .homeAndRentalSection(homeAndRentalRows):
            return homeAndRentalRows[indexPath.row]
            
        case let .documentsSection(documentsRows):
            return documentsRows[indexPath.row]
        }
    }
    
    
    func height(for indexPath: IndexPath) -> Int {
        switch self {
        case .autoSection(_):
            return 100
            
        case .homeAndRentalSection(_):
            return 120
            
        case .documentsSection(_):
            return 40
        }
    }
}



