//
//  ManageMyBillTableViewCell.swift
//  Quotes
//
//  Created by Dambar Bista on 9/21/21.
//

import UIKit

class ManageMyBillTableViewCell: UITableViewCell {
    
   
    
    let BillingScheduleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGreen
        return label
    }()
    
    let paymentScheduleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    let viewButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemGreen, for: .normal)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemGreen.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    
    lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        [self.BillingScheduleLabel,self.paymentScheduleLabel].forEach {stackView.addArrangedSubview($0)}
        
        return stackView
    }()

   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setUpCosntraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addViews() {
        contentView.addSubview(verticalStackView)
        contentView.addSubview(viewButton)
       
    }
    
   
    private func setUpCosntraint() {
        
        verticalStackView.snp.makeConstraints {
            $0.top.left.bottom.equalToSuperview().inset(20)

        }
        
        viewButton.snp.makeConstraints {
            $0.top.right.bottom.equalToSuperview().inset(20)
            $0.width.equalTo(100)
        }
    }
    
    func configureCell(with viewModel: ManageMyBillTableViewCellConfigurable) {
        
        guard let billItems = viewModel.manageMyBillItems else { return }
        BillingScheduleLabel.text = billItems.billingScheduleText
        paymentScheduleLabel.text = billItems.paymentScheduleText
        viewButton.setTitle(billItems.buttonTitleText, for: .normal)
    }
}

// MARK:- Protocols and ModelView

public protocol ManageMyBillTableViewCellConfigurable {
    
    var manageMyBillItems: ManageMyBillItems? { get}
}

class ManageMyBillTableViewCellViewModel: ManageMyBillTableViewCellConfigurable {
    var manageMyBillItems: ManageMyBillItems?
    
    init(manageMyBillItems: ManageMyBillItems) {
        self.manageMyBillItems = manageMyBillItems
    }
}
    
    
    

   

