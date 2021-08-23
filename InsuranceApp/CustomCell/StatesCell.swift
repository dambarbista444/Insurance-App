//
//  StatesCell.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 8/19/21.
//

import UIKit
import SnapKit

class StatesCell: UITableViewCell {
    
    let statesNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(statesNameLabel)
        setUpConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpConstraints() {
        statesNameLabel.snp.makeConstraints { make in
            make.center.equalTo(contentView.center)
        }
    }
    
}
