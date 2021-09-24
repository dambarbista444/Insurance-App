//
//  TableViewCell.swift
//  Quotes
//
//  Created by Dambar Bista on 9/22/21.
//

import UIKit

class SchedulePaymentsTableViewCell: UITableViewCell {
    
    let scheduleDateLabel = UILabel()
    let schedulePaymentLabel = UILabel()
    
    lazy var horizontalView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        [self.scheduleDateLabel,self.schedulePaymentLabel].forEach {
            stackView.addArrangedSubview($0)
            
        }
        
        return stackView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        let mainView = UIView()
        addViews(view: mainView)
        setUpConstraint(view: mainView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
   
    private func addViews(view: UIView) {
        addSubview(view)
        view.addSubview(horizontalView)
    }
    
    
    private func setUpConstraint(view: UIView)  {
        
        
        view.snp.makeConstraints {
            $0.top.bottom.left.right.equalToSuperview().inset(20)
        }
        
        horizontalView.snp.makeConstraints {
            $0.top.bottom.left.right.equalToSuperview()
        }
        
    
    }
    
    
    func configureCell(with viewModel: SchedulePaymentsTableViewCellViewConfigurable) {
        guard let schedulePaymentItems = viewModel.schedulePaymentItems else { return }
        scheduleDateLabel.text = schedulePaymentItems.scheduleDate
        schedulePaymentLabel.text = schedulePaymentItems.paymentSchedule
    }
}


// MARK:- Protocols

public protocol SchedulePaymentsTableViewCellViewConfigurable {
    
    var schedulePaymentItems: SchedulePaymentItems? { get }
}

// MARK:- ViewModel

class SchedulePaymentsTableViewCellViewModel: SchedulePaymentsTableViewCellViewConfigurable {
    var schedulePaymentItems: SchedulePaymentItems?
    
    init(schedulePaymentItems: SchedulePaymentItems) {
        self.schedulePaymentItems = schedulePaymentItems
    }
}
