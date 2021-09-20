//
//  HomeOrRentalCell.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 8/26/21.
//

import UIKit

class HomeAndRentalCell: UITableViewCell {
    
    var streetNameLabel = UILabel()
    var homeTypeLabel = UILabel()
    var policyEndDateLabel = UILabel()
    var forwardArrowImageView = UIImageView()
    
    lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        [self.streetNameLabel, self.homeTypeLabel, self.policyEndDateLabel ].forEach {
            stackView.addArrangedSubview($0)
            
        }
        return stackView
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let mainView = UIView()// view which hold stackview
        addViews(view: mainView)
        setUpConstraints(view: mainView)
    
        
        streetNameLabel.font = .systemFont(ofSize: 20)
        homeTypeLabel.font = .systemFont(ofSize: 18)
        policyEndDateLabel.font = .systemFont(ofSize: 18)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


    private func addViews(view: UIView) {
        
        view.addSubview(verticalStackView)
        contentView.addSubview(forwardArrowImageView)
        contentView.addSubview(view)
    }
    
    
    private func setUpConstraints(view: UIView) {
        
        
        view.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.left.equalTo(contentView.snp.left).offset(10)
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
    
    
    func configureCell(with viewModel: HomeAndRentalTableViewCellConfigurable) {
        guard let homeAndRentalItems = viewModel.homeAndRentalItems else {return}
        
        streetNameLabel.text = homeAndRentalItems.streetName
        homeTypeLabel.text = homeAndRentalItems.homeType
        policyEndDateLabel.text = homeAndRentalItems.policyEndDate
        forwardArrowImageView.image = homeAndRentalItems.forwardArrowImage
    }
    
}


// MARK:- Protocols
public protocol HomeAndRentalTableViewCellConfigurable {
    var homeAndRentalItems: HomeAndRentalItems? { get }
}


// MARK:- ViewModel
class HomeAndRentalTableViewCellViewModel: HomeAndRentalTableViewCellConfigurable {
    var homeAndRentalItems: HomeAndRentalItems?
    
    init(homeAndRentalItems: HomeAndRentalItems) {
        self.homeAndRentalItems = homeAndRentalItems
    }
    
}
