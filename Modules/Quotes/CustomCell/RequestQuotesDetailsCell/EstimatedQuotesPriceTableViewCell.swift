//
//  EstimatedQuotesPriceTableViewCell.swift
//  Quotes
//
//  Created by Dambar Bista on 9/21/21.
//

import UIKit

class EstimatedQuotesPriceTableViewCell: UITableViewCell {
    
    let topRowView = UIView()
    let bottomRowView = UIView()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$680"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    let EstimatedPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "Estimated price"
        label.textAlignment = .center
        label.textColor = .gray
        return label
    }()
    

    let autoDetails: UILabel = {
        let label = UILabel()
        label.text = "Nissan Altima: ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.helllo worldLorem ipsum dolor sit amet, consectetur adipiscing elit, sed"
        label.numberOfLines = 0
        return label
    }()
    
    let catagoryNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Catagory"
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    let catagoryItemsLabel: UILabel = {
        let label = UILabel()
        label.text = "Auto"
        label.textAlignment = .center
        return label
    }()
    
    let sectionsNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Mangage My Bill"
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()
    
    
    lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        [self.catagoryNameLabel, self.catagoryItemsLabel].forEach {stackView.addArrangedSubview($0)}
        
        return stackView
    }()
    
    
    lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        
        [self.priceLabel,self.EstimatedPriceLabel,self.topRowView ,self.horizontalStackView, self.bottomRowView , self.autoDetails, self.sectionsNameLabel].forEach {stackView.addArrangedSubview($0)}
        
        return stackView
    }()

   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setUpCosntraint()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addViews() {
        contentView.addSubview(verticalStackView)
    }
    
    
    private func setupViews() {
        topRowView.layer.borderWidth = 1
        bottomRowView.layer.borderWidth = 1
        topRowView.backgroundColor = .black
        bottomRowView.backgroundColor = .black
    }
    
    
    private func setUpCosntraint() {
        
        verticalStackView.snp.makeConstraints {
            $0.top.left.right.bottom.equalToSuperview().inset(20)
        }
        
        topRowView.snp.makeConstraints {
            $0.height.equalTo(1)
        }
        
        bottomRowView.snp.makeConstraints {
            $0.height.equalTo(1)
        }
        
        autoDetails.snp.makeConstraints {
            $0.height.equalTo(60)
        }
    }
}

// MARK:- Protocols and ModelView

public protocol EstimatedQuotesPriceTableViewCellConfigurable { }

class EstimatedQuotesPriceTableViewCellViewModel: EstimatedQuotesPriceTableViewCellConfigurable { }
    
    
    

   

