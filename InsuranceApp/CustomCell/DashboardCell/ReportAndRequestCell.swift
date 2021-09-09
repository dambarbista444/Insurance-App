//
//  ReportOrRequestCell.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 8/23/21.
//

import UIKit
import SnapKit

class ReportAndRequestCell: UITableViewCell {
    
    let reportAndRequestLablel = UILabel()
    let forwardArrowImageView = UIImageView()
    
    lazy var horizontalView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        [self.reportAndRequestLablel,self.forwardArrowImageView].forEach {
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
        addSubview(reportAndRequestLablel)
        addSubview(forwardArrowImageView)
        addSubview(view)
        view.addSubview(horizontalView)
        
    }
    
    
    private func setUpConstraint(view: UIView)  {
        
        
        view.snp.makeConstraints {
            $0.top.bottom.left.right.equalToSuperview()
        }
        
        horizontalView.snp.makeConstraints {
            $0.top.bottom.left.right.equalToSuperview()
        }
        
        forwardArrowImageView.snp.makeConstraints {
            
            $0.top.equalTo(horizontalView.snp.top).offset(10)
            $0.right.equalToSuperview()
            $0.height.equalTo(40)
            $0.width.equalTo(10)
        }
    }
    
    
    func configureCell(with viewModel: ReportAndRequestTableViewCellConfigurable) {
        
        guard let reportAndRequestItems = viewModel.reportAndRequestItems else { return }
        reportAndRequestLablel.text = reportAndRequestItems.serviceType
        forwardArrowImageView.image = reportAndRequestItems.arrowImage
    }
    
}


// MARK:- Protocols

protocol ReportAndRequestTableViewCellConfigurable {
    var reportAndRequestItems: ReportAndRequestItems? { get }
}


// MARK:- View Model

class ReportAndRequestTableViewCellViewModel: ReportAndRequestTableViewCellConfigurable {
   
    var reportAndRequestItems: ReportAndRequestItems?
    
    init(reportAndRequestItems: ReportAndRequestItems) {
        self.reportAndRequestItems = reportAndRequestItems
    }
}


