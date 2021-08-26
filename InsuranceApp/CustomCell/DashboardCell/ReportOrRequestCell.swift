//
//  ReportOrRequestCell.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 8/23/21.
//

import UIKit
import SnapKit

class ReportOrRequestCell: UITableViewCell {
    
    let reportOrRequestLablel = UILabel()
    let forwardArrowImage = UIImageView()
    
    lazy var horizontalView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        [self.reportOrRequestLablel,self.forwardArrowImage].forEach {
            stackView.addArrangedSubview($0)
            
        }
        
        return stackView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        let mainView = UIView()
        addViews(view: mainView)
        setUpConstraint(view: mainView)
        configureItemsFromExtension()
    }
    
    
    private func configureItemsFromExtension() {
        
        reportOrRequestLablel.reuseableLabel(text: "", textAlignment: .left, heightConstant: 30, widthConstant: contentView.frame.width / 1, fontSize: 18)
        
        forwardArrowImage.reuseableImageView(image: UIImage(systemName: "chevron.forward")!)
        
    }
    
    
    private func addViews(view: UIView) {
        addSubview(reportOrRequestLablel)
        addSubview(forwardArrowImage)
        addSubview(view)
        view.addSubview(horizontalView)
        
    }
    
    
    private func setUpConstraint(view: UIView)  {
        
        view.frame = contentView.frame
        horizontalView.frame = view.frame
        
        view.snp.makeConstraints { make in
            make.right.equalTo(contentView.snp.right).offset(-20)
            make.left.equalTo(contentView.snp.left).offset(10)
            
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
