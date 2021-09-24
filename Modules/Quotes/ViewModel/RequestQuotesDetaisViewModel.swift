//
//  RequestQuotesDetaisViewModel.swift
//  Quotes
//
//  Created by Dambar Bista on 9/21/21.
//

import Foundation

//
//  QuotesViewModel.swift
//  Quotes
//
//  Created by Dambar Bista on 9/6/21.
//

import Foundation

 

protocol RequestQuotesViewCofigurable {
    
    var numberOfSections: Int { get }
    var titileForSections: [String] { get }
    func numberOfRowsPerSection(section: Int) -> Int
    func heightForRowAt(indexPath: IndexPath) -> Int
    func row(for indexPath: IndexPath) -> RequestQuotesDetailsRow?
    func actionForSectionButton(section: Int, tableView: UITableView) -> UIAction
}

extension RequestQuotesViewCofigurable {
    
    public var titileForSections: [String] {
        let titles = ["", "Update payment Methods", "Make a payment", "Payment Plan, Billing Schedule and Paperless Billing"]
        return titles
    }
}


class RequestQuotesViewModel: RequestQuotesViewCofigurable {
   
    var sections = [RequestQuotesDetailsSection]()
    var dataProvider: ManageMyBillDataProviderConfigurable
    
    public init(dataProvider: ManageMyBillDataProviderConfigurable = ManageMyBillDataProvider.shared) {
        self.dataProvider = dataProvider
        configureSection()
    }
    
    func configureSection() {
        
        let manageMybillData = dataProvider.loadManageMyBillData()
        
        var estimateQuotesPriceRows = [RequestQuotesDetailsRow]()
        var updatePaymentMethodsRows = [RequestQuotesDetailsRow]()
        var makeAPaymentRows = [RequestQuotesDetailsRow]()
        var paymentPlanRows = [RequestQuotesDetailsRow]()
        
        /// Items for first Seciton
        estimateQuotesPriceRows.append(RequestQuotesDetailsRow.estimateQuotesPriceRow(EstimatedQuotesPriceTableViewCellViewModel()))
        
        /// Items for second Section
        /// paymentPlanRows , makeAPaymentRows and updatePaymentMethodsRows appending same content from data provider because i  want to display the same content in each section
        
        if let firstRowItems = manageMybillData?.firstRowItem {
            updatePaymentMethodsRows.append(RequestQuotesDetailsRow.updatePaymentMethodsRow(ManageMyBillTableViewCellViewModel(manageMyBillItems: firstRowItems)))
            makeAPaymentRows.append(RequestQuotesDetailsRow.makeAPayementRow(ManageMyBillTableViewCellViewModel(manageMyBillItems: firstRowItems)))
            paymentPlanRows.append(RequestQuotesDetailsRow.paymentPlanRow(ManageMyBillTableViewCellViewModel(manageMyBillItems: firstRowItems)))
        }
        
        if let secondRowItems = manageMybillData?.secondRowItem{
            updatePaymentMethodsRows.append(RequestQuotesDetailsRow.updatePaymentMethodsRow(ManageMyBillTableViewCellViewModel(manageMyBillItems: secondRowItems)))
            makeAPaymentRows.append(RequestQuotesDetailsRow.makeAPayementRow(ManageMyBillTableViewCellViewModel(manageMyBillItems: secondRowItems)))
            paymentPlanRows.append(RequestQuotesDetailsRow.paymentPlanRow(ManageMyBillTableViewCellViewModel(manageMyBillItems: secondRowItems)))
            
        }
        
        if let thirdRowItems = manageMybillData?.thirdRowItem{
            updatePaymentMethodsRows.append(RequestQuotesDetailsRow.updatePaymentMethodsRow(ManageMyBillTableViewCellViewModel(manageMyBillItems: thirdRowItems)))
            makeAPaymentRows.append(RequestQuotesDetailsRow.makeAPayementRow(ManageMyBillTableViewCellViewModel(manageMyBillItems: thirdRowItems)))
            paymentPlanRows.append(RequestQuotesDetailsRow.paymentPlanRow(ManageMyBillTableViewCellViewModel(manageMyBillItems: thirdRowItems)))
        }
        
        sections.append(RequestQuotesDetailsSection.estimateQuotesPriceSection(estimateQuotesPriceRows))
        sections.append(RequestQuotesDetailsSection.updatePaymentMethodsSection(updatePaymentMethodsRows))
        sections.append(RequestQuotesDetailsSection.makeAPaymentSection(makeAPaymentRows))
        sections.append(RequestQuotesDetailsSection.paymentPlantSection(paymentPlanRows))
    }
    
}

extension RequestQuotesViewModel {
    
    var numberOfSections: Int {
        return sections.count
    }
    
    func numberOfRowsPerSection(section: Int) -> Int {
        return sections[section].numberOfRows()
    }
    
    func heightForRowAt(indexPath: IndexPath) -> Int {
        return sections[indexPath.section].height(for: indexPath)
    }
    
    func row(for indexPath: IndexPath) -> RequestQuotesDetailsRow? {
        return sections[indexPath.section].row(for: indexPath)
    }
    
    func actionForSectionButton(section: Int, tableView: UITableView) -> UIAction {
        return sections[section].actionForSectionButton(section: section, tableView: tableView)
    }
}


public enum RequestQuotesDetailsRow {
    case estimateQuotesPriceRow(EstimatedQuotesPriceTableViewCellConfigurable)
    case updatePaymentMethodsRow(ManageMyBillTableViewCellConfigurable)
    case makeAPayementRow(ManageMyBillTableViewCellConfigurable)
    case paymentPlanRow(ManageMyBillTableViewCellConfigurable)
}


enum RequestQuotesDetailsSection {
    case estimateQuotesPriceSection([RequestQuotesDetailsRow])
    case updatePaymentMethodsSection([RequestQuotesDetailsRow])
    case makeAPaymentSection([RequestQuotesDetailsRow])
    case paymentPlantSection([RequestQuotesDetailsRow])
    
    
    func numberOfRows() -> Int {
        
        switch self {
        case let .estimateQuotesPriceSection(rows):
            return rows.count
            
        case let .updatePaymentMethodsSection(rows) :
            return rows.count
            
        case let .makeAPaymentSection(rows):
            return rows.count
            
        case let .paymentPlantSection(rows):
            return rows.count
        }
    }
    
    
    func row(for indexPath: IndexPath) -> RequestQuotesDetailsRow? {
        
        switch self {
        case let .estimateQuotesPriceSection(rows):
            return rows[indexPath.row]
            
        case let .updatePaymentMethodsSection(rows):
            return rows[indexPath.row]
            
        case let .makeAPaymentSection(rows):
            return rows[indexPath.row]
            
        case let .paymentPlantSection(rows):
            return rows[indexPath.row]
        }
    }
    
    func height(for indexPath: IndexPath) -> Int {
        switch self {
        case .estimateQuotesPriceSection(_):
            return 240
            
        case .updatePaymentMethodsSection(_):
            return 80
        case .makeAPaymentSection(_):
            return 80
        case .paymentPlantSection(_):
            return 80
        }
    }
    
    func actionForSectionButton(section: Int, tableView: UITableView) -> UIAction {
        
        switch self {
        
        case .estimateQuotesPriceSection(_):
            
            let action = UIAction { action in
             /// No action needed
            }
            return action
            
        case .updatePaymentMethodsSection(_):
            let action = UIAction { action in
        
                RequestQuotesDetailsVC.isUpdatePaymentSectionCollapsed = !RequestQuotesDetailsVC.isUpdatePaymentSectionCollapsed
                tableView.reloadSections(IndexSet(integer: 1), with: .automatic)
            }
            return action
            
        case .makeAPaymentSection(_):
            let action = UIAction { action in
             
                RequestQuotesDetailsVC.isMakeAPaymentSectionCollapsed = !RequestQuotesDetailsVC.isMakeAPaymentSectionCollapsed
                tableView.reloadSections(IndexSet(integer: 2), with: .automatic)
            }
            return action
            
        case .paymentPlantSection(_):
            let action = UIAction { action in
                RequestQuotesDetailsVC.isPaymentPlanSectionCollapsed = !RequestQuotesDetailsVC.isPaymentPlanSectionCollapsed
                tableView.reloadSections(IndexSet(integer: 3), with: .automatic)
            }
            return action
        }
    }
}
