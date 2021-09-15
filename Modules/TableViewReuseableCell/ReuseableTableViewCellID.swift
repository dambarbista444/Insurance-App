//
//  ReuseableTableViewCell.swift
//  TableViewReuseableCell
//
//  Created by Dambar Bista on 9/14/21.
//

import Foundation
import UIKit

//The purpose of creating this module is  making it reuseable everywhere in project, so doesn't have to create new everytime

public protocol ReuseableViewConfigurable {
    static var reuseableIdentifier: String {get}
    
}

extension ReuseableViewConfigurable {
    public static var reuseableIdentifier: String {
        String(describing: self)
    }
    
}

extension UITableViewCell: ReuseableViewConfigurable {}

extension UITableView {
    
   public func cell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseableIdentifier, for: indexPath) as? T else {
            fatalError("Unable to load cell indetifier \(T.reuseableIdentifier)")
        }
        return cell
    
    }
    
    
    public func registerCell<T: UITableViewCell>(cellType: T.Type) {
        register(cellType, forCellReuseIdentifier: cellType.reuseableIdentifier)
    }
    
}





