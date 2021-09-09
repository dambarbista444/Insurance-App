//
//  QuotesViewModel.swift
//  Quotes
//
//  Created by Dambar Bista on 9/6/21.
//

import Foundation


public protocol QuotesViewConfigurable {
    
    var numberOfSections: Int { get }
    var titileForSections: [String] { get }
    func numberOfRowPerSection(section: Int) -> Int
    func heightForRowAt(indexPath: IndexPath) -> Int
    func row(for indexPath: IndexPath) -> QuotesRow?
}

extension QuotesViewConfigurable {
    
    public var titileForSections: [String] {
        let titles = ["My Quotes", "Request a Quote", "How it Works"]
        return titles
    }
}


public class QuotesViewModel: QuotesViewConfigurable {
    
    var sections = [QuotesSection]()
    private var dataProvider: QuotesDataProviderConfigurable
    
    public init(dataProvider: QuotesDataProviderConfigurable = QuotesDataProvider.shared) {
        self.dataProvider = dataProvider
        configureSection()
    }
    
    func configureSection() {
        
        let quotesData = dataProvider.loadQuotesData()
        var myQuotesRows = [QuotesRow]()
        var requestQuotesRows = [QuotesRow]()
        var quotesDetailsRows = [QuotesRow]()
        
        /// My Quotes
        if let myQuotesItems = quotesData {
            
            myQuotesRows.append(QuotesRow.myQuotesRow(MyQuotesTableViewCellViewModel(myQuotesItems: myQuotesItems.lifeInsuranceOne)))
            myQuotesRows.append(QuotesRow.myQuotesRow(MyQuotesTableViewCellViewModel(myQuotesItems: myQuotesItems.lifeInsuranecTwo)))
            myQuotesRows.append(QuotesRow.myQuotesRow(MyQuotesTableViewCellViewModel(myQuotesItems: myQuotesItems.vehicleInsurance)))
            
            sections.append(QuotesSection.myQuotesSection(myQuotesRows))
        }
        
        /// Request Quotes
        requestQuotesRows.append(QuotesRow.requestQuoteRow(RequestQuoteTableViewCellViewModel()))
        sections.append(QuotesSection.requestQuotesSection(requestQuotesRows))
        
        /// QuotesDetails
        quotesDetailsRows.append(QuotesRow.quotesDetailsRow(QuotesDetailsTableViewCellViewModel()))
        sections.append(QuotesSection.quotesDetails(quotesDetailsRows))
    }
    
}

extension QuotesViewModel {
    
    public var numberOfSections: Int  {
        return sections.count
    }
    
    public func numberOfRowPerSection(section: Int) -> Int {
        return sections[section].numberOfRows()
    }
    
    public func row(for indexPath: IndexPath) -> QuotesRow? {
        return sections[indexPath.section].row(for: indexPath)
    }
    
    public func heightForRowAt(indexPath: IndexPath) -> Int {
        return sections[indexPath.section].height(for: indexPath)
    }
}


public enum QuotesRow {
    case myQuotesRow(MyQuotesTableViewCellConfigurable)
    case requestQuoteRow(RequestQuoteTableViewCellConfigurable)
    case quotesDetailsRow(QuotesDetailsTableViewCellConfigurable)
}


enum QuotesSection {
    case myQuotesSection([QuotesRow])
    case requestQuotesSection([QuotesRow])
    case quotesDetails([QuotesRow])
    
    func numberOfRows() -> Int {
        
        switch self {
        case let .myQuotesSection(quotesRows):
            return quotesRows.count
            
        case let .requestQuotesSection(requestQuotesRows):
            return requestQuotesRows.count
            
        case let .quotesDetails(quotesDetailsRows):
            return quotesDetailsRows.count
        }
    }
    
    
    func row(for indexPath: IndexPath) -> QuotesRow? {
        
        switch self {
        case let .myQuotesSection(quotesRows):
            return quotesRows[indexPath.row]
            
        case let .requestQuotesSection(requestQuotesRow):
            return requestQuotesRow[indexPath.row]
            
        case let .quotesDetails(quotesDetailsRows):
            return quotesDetailsRows[indexPath.row]
        }
    }
    
    func height(for indexPath: IndexPath) -> Int {
        switch self {
        case .myQuotesSection(_):
            return 40
            
        case .requestQuotesSection(_):
            return 180
            
        case .quotesDetails(_):
            return 220
        }
    }
}
