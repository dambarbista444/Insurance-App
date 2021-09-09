//
//  ReuseableTableViewCellIdentifier.swift
//  Quotes
//
//  Created by Dambar Bista on 9/6/21.
//

import Foundation


import UIKit


protocol ReuseableViewProtocol {
    static var reuseableIdentifier: String { get }
}

extension ReuseableViewProtocol {
    
    static var reuseableIdentifier: String {
      String(describing: self)
    }
}

extension UITableViewCell: ReuseableViewProtocol {}


extension UITableView {
    
    func cell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseableIdentifier, for: indexPath) as? T else {
            fatalError("Unable to load cell indetifier \(T.reuseableIdentifier)")
        }
        return cell
    }
    
    
    func registerCell<T: UITableViewCell>(cellType: T.Type) {
        register(cellType, forCellReuseIdentifier: cellType.reuseableIdentifier)
    }
}


