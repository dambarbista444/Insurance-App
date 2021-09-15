//
//  PopUpViewModel.swift
//  PopUp
//
//  Created by Dambar Bista on 9/13/21.
//

import Foundation

public protocol PopupViewConfigurable {
    var numberOfSection: Int { get}
    func numberOfRowsForSection(section: Int) -> Int
    
    func row(for indexPath: IndexPath) -> PopoutRow?
    
}

extension PopupViewConfigurable {
    
    
}



public class PopupViewModel: PopupViewConfigurable {
   
    var sections = [PopoutSection]()
    private var dataPorvider: PopoutDataProviderConfigurable
    
    public init(dataProvider: PopoutDataProviderConfigurable = PopoutDataProvider.shared) {
        self.dataPorvider = dataProvider
        configureSectionWithDataProviderData()
    }
    
    
    func configureSectionWithDataProviderData() {
        
        let popoutData = dataPorvider.loadPopoutData()
        var vehiclesInsuraceQuoteRows = [PopoutRow]()
        
        if let vehicleInsuraceDetails = popoutData?.vehicleInsuraceDetails{
            vehiclesInsuraceQuoteRows.append(PopoutRow.vehicleInsuranceQuotes(PopupTableViewCellViewModel(vehicleDetails: vehicleInsuraceDetails)))
            sections.append(PopoutSection.vehicleInsuranceQuotesRows(vehiclesInsuraceQuoteRows))
            
        }
        
    }
    
    
    
    
}

extension PopupViewModel {
    

    public var numberOfSection: Int {
        return sections.count
    }
    
    
    public func numberOfRowsForSection(section: Int) ->  Int {
        return sections[section].numberOfRows()
    }
    
    public func row(for indexPath: IndexPath) -> PopoutRow? {
        return sections[indexPath.section].row(for: indexPath)
    }
    
}


public enum PopoutRow {
    case vehicleInsuranceQuotes(PopupTableViewCellConfigurable)
    
}


enum PopoutSection {
    
    case vehicleInsuranceQuotesRows([PopoutRow])
    
    func numberOfRows() -> Int {
        switch self {
        case let .vehicleInsuranceQuotesRows(vehicleInsuranceQuotesRows):
            return vehicleInsuranceQuotesRows.count
        }
    }
    
    
    func row(for indexPath: IndexPath) -> PopoutRow {
        switch self {
        case let .vehicleInsuranceQuotesRows(vehicleInsuranceQuotesRows):
            return vehicleInsuranceQuotesRows[indexPath.row]
            
        }
    }
}

