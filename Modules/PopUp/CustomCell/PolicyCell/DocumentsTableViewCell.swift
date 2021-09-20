//
//  DocumentsTableViewCell.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 9/5/21.
//

import UIKit

class DocumentsTableViewCell: UITableViewCell {
    
    let documentsLabel = UILabel()
    let forwardArrowImageView = UIImageView()
    
    lazy var horizontalView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        [self.documentsLabel,self.forwardArrowImageView].forEach {
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
    
    
    func configureCell(with ViewModel: DocumentsTableViewCellConfigurable) {
        guard let documentsItems = ViewModel.documentsItems else { return }
        documentsLabel.text = documentsItems.documentsItems
        forwardArrowImageView.image = documentsItems.arrowImage
    }
}


// MARK:- Protocols

public protocol DocumentsTableViewCellConfigurable {
    var documentsItems: DocumentsItems? {get}
}


// MARK:- ViewModel

class DocumentsTableViewCellViewModel: DocumentsTableViewCellConfigurable {
   
    var documentsItems: DocumentsItems?
    
    init(documentsItems: DocumentsItems?) {
        self.documentsItems = documentsItems
    }
}





