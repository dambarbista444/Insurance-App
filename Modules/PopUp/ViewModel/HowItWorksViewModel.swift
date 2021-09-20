//
//  PopUpViewModel.swift
//  PopUp
//
//  Created by Dambar Bista on 9/13/21.
//

import Foundation

public protocol PopupViewConfigurable {
    
    var titleForHeader: String { get }
    var numberOfSection: Int { get}
    var titleForButton: String { get }
    
    func numberOfRowsForSection(section: Int) -> Int
    func popoutButtonAction(vc: UIViewController) -> UIAction
    func row(for indexPath: IndexPath) -> PopoutRow?
}

public class HowItworksViewModel: PopupViewConfigurable {
   
    var sections = [PopoutSection]()
    private var dataPorvider: PopoutDataProviderConfigurable
    
    public init(dataProvider: PopoutDataProviderConfigurable = PopoutDataProvider.shared) {
        self.dataPorvider = dataProvider
        configureSectionWithDataProviderData()
    }
    
    func configureSectionWithDataProviderData() {
        
        let popoutData = dataPorvider.loadPopoutData()
        var autoInsuraceQuoteRows = [PopoutRow]()
        
        ///For now vehicle insurace details data are not used in cell
        if let autoInsuraceDetails = popoutData?.autoInsuraceDetails{
            autoInsuraceQuoteRows.append(PopoutRow.autoInsuranceQuotesDetailsRow(PopupTableViewCellViewModel(autoDetails: autoInsuraceDetails)))
            sections.append(PopoutSection.autoInsuranceQuotesDetailsSection(autoInsuraceQuoteRows))
        }
    }
}

extension HowItworksViewModel {
    
    public var titleForHeader: String {
        return "How It Works"
    }
    
    public var titleForButton: String {
        return "OK"
    }
    
    public var numberOfSection: Int {
        return sections.count
    }
    
    public func numberOfRowsForSection(section: Int) ->  Int {
        return sections[section].numberOfRows()
    }
    
    public func row(for indexPath: IndexPath) -> PopoutRow? {
        return sections[indexPath.section].row(for: indexPath)
    }
    
    public func popoutButtonAction(vc: UIViewController) -> UIAction {
    
        let action = UIAction { action in
            vc.dismiss(animated: true, completion: nil)
        }
        return action
    }
    
}


public enum PopoutRow {
    case autoInsuranceQuotesDetailsRow(PopupTableViewCellConfigurable)
    case autoDetailsRow(AutoDetailsTableViewCellConfigurable)
}


enum PopoutSection {
    
    case autoInsuranceQuotesDetailsSection([PopoutRow])
    case autoDetailsSection([PopoutRow])
    
    func numberOfRows() -> Int {
        switch self {
        case let .autoInsuranceQuotesDetailsSection(autoInsuranceQuotesRows):
            return autoInsuranceQuotesRows.count
            
        case let .autoDetailsSection(autoDetailsRows):
            return autoDetailsRows.count
        }
    }
    
    
    func row(for indexPath: IndexPath) -> PopoutRow {
        switch self {
        case let .autoInsuranceQuotesDetailsSection(autoInsuranceQuotesRows):
            return autoInsuranceQuotesRows[indexPath.row]
            
        case let.autoDetailsSection(autoDetailsRows):
            return autoDetailsRows[indexPath.row]
        }
    }
}

