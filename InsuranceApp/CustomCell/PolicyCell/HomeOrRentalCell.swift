//
//  HomeOrRentalCell.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 8/26/21.
//

import UIKit

class HomeOrRentalCell: UITableViewCell {
    
    var addressLabel = UILabel()
    var rentalLabel = UILabel()
    var policyLabel = UILabel()
    var forwardArrowImage = UIImageView()
    
    lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        [self.addressLabel, self.rentalLabel, self.policyLabel ].forEach {
            stackView.addArrangedSubview($0)
            
        }
        return stackView
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let mainView = UIView()// view which hold stackview
        addViews(view: mainView)
        setUpConstraints(view: mainView)
        configureItemFromExtension()
    }
    
    
    private func configureItemFromExtension() {
        
       
        addressLabel.reuseableLabel(text: "7000 Christopher Dr", textAlignment: .left, heightConstant: 20, widthConstant: contentView.frame.width - 40, fontSize: 20)
        rentalLabel.reuseableLabel(text: "Rental", textAlignment: .left, heightConstant: 20, widthConstant: contentView.frame.width - 40, fontSize: 20)
        policyLabel.reuseableLabel(text: "Policy End Date: 09/13/2021", textAlignment: .left, heightConstant: 20, widthConstant: contentView.frame.width - 40, fontSize: 20)

        forwardArrowImage.reuseableImageView(image: UIImage(systemName: "chevron.forward")!)
    }
    
    
    private func addViews(view: UIView) {
        
        view.addSubview(verticalStackView)
        contentView.addSubview(forwardArrowImage)
        contentView.addSubview(view)
        
    }
    
    
    private func setUpConstraints(view: UIView) {
        
        
        view.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.left.equalTo(contentView.snp.left).offset(10)
            make.right.equalTo(forwardArrowImage.snp.right).offset(-10)
            make.bottom.equalTo(contentView.snp.bottom).offset(-20)
        }
        
        
        forwardArrowImage.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(40)
            make.left.equalTo(view.snp.right).offset(20)
            make.right.equalTo(contentView.snp.right)
            make.height.equalTo(25)
            make.width.equalTo(20)
        }
        verticalStackView.frame = view.frame
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
