//
//  SelectNewPaymentPlanTableViewCell.swift
//  Quotes
//
//  Created by Dambar Bista on 9/22/21.
//

import UIKit

class SelectNewPaymentPlanTableViewCell: UITableViewCell {
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

public protocol SelectNewPaymentPlanTableViewCellConfigurable { }

class SelectNewPaymentPlanTableViewCellViewModel: SelectNewPaymentPlanTableViewCellConfigurable { }
