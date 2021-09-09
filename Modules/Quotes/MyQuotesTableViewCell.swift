//
//  QuotesTableViewCell.swift
//  Quotes
//
//  Created by Dambar Bista on 9/6/21.
//

import UIKit

class MyQuotesTableViewCell: UITableViewCell {

    
    let myQuotesLabel = UILabel()
    let forwardArrowImageView = UIImageView()
    
    lazy var horizontalView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        [self.myQuotesLabel,self.forwardArrowImageView].forEach {
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
    
    
    func configureCell(with ViewModel: MyQuotesTableViewCellConfigurable) {
        
        guard let myQuotesItems = ViewModel.myQuotesItems else { return }
        myQuotesLabel.text = myQuotesItems.quotesItems
        forwardArrowImageView.image = myQuotesItems.arrowImage
    }

}


// MARK:- Protocols
public protocol MyQuotesTableViewCellConfigurable {
    var myQuotesItems: MyQuotesItems? {get}
}


// MARK:- ViewModel

class MyQuotesTableViewCellViewModel: MyQuotesTableViewCellConfigurable {
   
    var myQuotesItems: MyQuotesItems?
    
    init(myQuotesItems: MyQuotesItems?) {
        self.myQuotesItems = myQuotesItems
    }
}

