//
//  AutoPopupViewModel.swift
//  PopUp
//
//  Created by Dambar Bista on 9/17/21.
//

import Foundation


class AutoDetailsPopupViewModel: PopupViewConfigurable {
    
    var sections = [PopoutSection]()
    
    init() {
        congigureSection()
    }
    
    func congigureSection() {
        
        var rows = [PopoutRow]()
        rows.append(PopoutRow.autoDetailsRow(AutoDetailsTableViewCellViewModel()))
        sections.append(PopoutSection.autoDetailsSection(rows))
    }
}

extension AutoDetailsPopupViewModel {
    
    public var titleForHeader: String {
        return "Payment"
    }
    
    public var titleForButton: String {
        return "Pay Now"
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
        
        let alertController = UIAlertController(title: "Auto Bill", message: "Want to pay bill?", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { action in
            vc.dismiss(animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        let action = UIAction { action in
          vc.present(alertController, animated: true, completion: nil)
        }
        return action
    }

}
