//
//  AutoCell.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 8/25/21.
//

import UIKit

class AutoCell: UITableViewCell {
    
    
    var vehicleImage = UIImageView()
    var carModel = UILabel()
    var dateLabel = UILabel()
    var forwardArrowImage = UIImageView()
    
    lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        [self.carModel,self.dateLabel ].forEach {
            stackView.addArrangedSubview($0)
            
        }
        return stackView
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let mainView = UIView()// view which hold stackview
        addViews(view: mainView)
        setUpConstraints(view: mainView)
        vehicleImage.layer.cornerRadius = 10
        vehicleImage.clipsToBounds = true
        configureItemFromExtension()
    }
    
    
    private func configureItemFromExtension() {
        
        vehicleImage.reuseableImageView(image: UIImage(named: "vehicleImg.jpeg")!)
        carModel.reuseableLabel(text: "2012 Nissan Altima", textAlignment: .left, heightConstant: 20, widthConstant: contentView.frame.width - 40, fontSize: 20)
        dateLabel.reuseableLabel(text: "Next Billing Date: 08/24/2021", textAlignment: .left, heightConstant: 20, widthConstant: contentView.frame.width - 40, fontSize: 16)
        forwardArrowImage.reuseableImageView(image: UIImage(systemName: "chevron.forward")!)
    }
    
    
    private func addViews(view: UIView) {
        
        
        contentView.addSubview(vehicleImage)
        view.addSubview(verticalStackView)
        contentView.addSubview(forwardArrowImage)
        contentView.addSubview(view)
    }
    
    
    private func setUpConstraints(view: UIView) {
        
        vehicleImage.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.left.equalTo(contentView.snp.left).offset(10)
            make.height.equalTo(60)
            make.width.equalTo(60)
        }
        
        view.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.left.equalTo(vehicleImage.snp.right).offset(10)
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
