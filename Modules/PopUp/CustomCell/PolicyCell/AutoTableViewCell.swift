//
//  AutoCell.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 8/25/21.
//

import UIKit

class AutoTableViewCell: UITableViewCell {
    
    
    var vehicleImageView = UIImageView()
    var vehicleNameLabel = UILabel()
    var billDateLabel = UILabel()
    var forwardArrowImageView = UIImageView()
    
    lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        [self.vehicleNameLabel,self.billDateLabel ].forEach {
            stackView.addArrangedSubview($0)
            
        }
        return stackView
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let mainView = UIView()// view which hold stackview
        addViews(view: mainView)
        setUpConstraints(view: mainView)
        
        vehicleImageView.layer.cornerRadius = 10
        vehicleImageView.clipsToBounds = true
        
        vehicleNameLabel.font = .systemFont(ofSize: 20)
        billDateLabel.font = .systemFont(ofSize: 18)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addViews(view: UIView) {
        
        
        contentView.addSubview(vehicleImageView)
        view.addSubview(verticalStackView)
        contentView.addSubview(forwardArrowImageView)
        contentView.addSubview(view)
    }
    
    
    private func setUpConstraints(view: UIView) {
        
        vehicleImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.left.equalTo(contentView.snp.left).offset(10)
            make.height.equalTo(60)
            make.width.equalTo(60)
        }
        
        view.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.left.equalTo(vehicleImageView.snp.right).offset(10)
            make.right.equalTo(forwardArrowImageView.snp.right).offset(-10)
            make.bottom.equalTo(contentView.snp.bottom).offset(-20)
        }
        
        
        forwardArrowImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(40)
            make.left.equalTo(view.snp.right).offset(20)
            make.right.equalTo(contentView.snp.right)
            make.height.equalTo(25)
            make.width.equalTo(20)
        }
        verticalStackView.frame = view.frame
    }
    
    
    func configureCell(with viewModel: AutoTableViewCellConfigurable) {
        
        guard let autoItems =  viewModel.autoItems else {return}
        vehicleNameLabel.text = autoItems.vehicleName
        vehicleImageView.image = autoItems.vehicleImage
        billDateLabel.text = autoItems.billingDate
        forwardArrowImageView.image = autoItems.forwardArrowImage
    }
}


public protocol AutoTableViewCellConfigurable {
    var autoItems: AutoItems? {get}
}

class AutoTableViewCellViewModel: AutoTableViewCellConfigurable {
   
    var autoItems: AutoItems?
    
    init(autoItems: AutoItems?) {
        self.autoItems = autoItems
    }
}
