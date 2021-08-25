//
//  MyIDsCollectionsViewCill.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 8/24/21.
//

import UIKit
import SnapKit

class MyCardCollectionsViewCill: UICollectionViewCell {
    

    var cardView = UIView()
    let cardName = UILabel()

    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        cardView.backgroundColor = .systemGreen
        contentView.addSubview(cardView)
        contentView.addSubview(cardName)
        setUpConstraints()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        cardName.reuseableLabel(text: "Card", textAlignment: .center, heightConstant: 260, widthConstant: 300, fontSize: 18)
        cardName.font = .boldSystemFont(ofSize: 30)
    }
    
    
    private func setUpConstraints() {
        
        cardView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.left.equalTo(contentView.snp.left)
            make.right.equalTo(contentView.snp.right)
            make.bottom.equalTo(contentView.snp.bottom)
        }
        
        cardName.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.left.equalTo(contentView.snp.left)
            make.right.equalTo(contentView.snp.right)
            make.bottom.equalTo(contentView.snp.bottom)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
