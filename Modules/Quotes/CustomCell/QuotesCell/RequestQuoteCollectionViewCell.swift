//
//  RequestQuoteCollectionViewCell.swift
//  Quotes
//
//  Created by Dambar Bista on 9/6/21.
//

import UIKit
import SnapKit

class RequestQuoteCollectionViewCell: UICollectionViewCell {
    
    
    let priceLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(priceLabel)
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 1
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpConstraints() {
        priceLabel.snp.makeConstraints({
            $0.centerX.centerY.equalToSuperview()
            
        })
    }
    
}
