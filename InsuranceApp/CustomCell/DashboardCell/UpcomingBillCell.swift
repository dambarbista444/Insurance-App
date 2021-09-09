//
//  TableViewCell.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 8/23/21.
//

import UIKit
import SnapKit

class UpcomingBillCell: UITableViewCell {
    
    let loadingLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addViews()
        setUpConstraints()
        contentView.backgroundColor = .gray
        contentView.layer.cornerRadius = 15
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addViews() {
        contentView.addSubview(loadingLabel)
    }
    
    
    private func setUpConstraints() {
        
        loadingLabel.snp.makeConstraints { make in
            make.center.equalTo(contentView.snp.center)
        }
    }
    
    
    func configureCell(with viewModel: UpcomingBillTableViewCellConfigurable) {
        guard let billItems = viewModel.billItems else { return }
        loadingLabel.text = billItems.status
    }
    
   
    
}


// MARK:- Protocols

protocol UpcomingBillTableViewCellConfigurable {
    var billItems: UpComingBillItems? { get }
}


// MARK:- View Model

class UpcomingBillTableViewCellViewModel: UpcomingBillTableViewCellConfigurable {
   
    var billItems: UpComingBillItems?
    
    init(billItems: UpComingBillItems?) {
        self.billItems = billItems
    }
}
