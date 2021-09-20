//
//  QuotesDetailsTableViewCell.swift
//  Quotes
//
//  Created by Dambar Bista on 9/6/21.
//

import UIKit

class QuotesDetailsTableViewCell: UITableViewCell {
    
    let qutoesDetailsLabel: UILabel =  {
        let label = UILabel()
        label.text = "helllo worldLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.helllo worldLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.helllo worldLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.labore et dolore magna aliqua aliqe..."
        label.numberOfLines = 0
        return label
    }()
    
    let readMoreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("More", for: .normal)
        button.setTitleColor(.blue, for: .normal)

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(qutoesDetailsLabel)
        contentView.addSubview(readMoreButton)
        readMoreButton.addTarget(self, action: #selector(showMoreQuotesDetails), for: .touchUpInside)
        setUpConstraints()
        hideReadMoreButton()
    }
    
    private func hideReadMoreButton() {
        
        if qutoesDetailsLabel.text!.count < 440 {
            readMoreButton.isHidden = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Sending notification to QuotesVC to perfrom task. Task is to pop up QuotesDetailsVC() to display more content there about readmore
    @objc private func showMoreQuotesDetails() {
        NotificationCenter.default.post(name: Notification.Name("popUpQuotesDetailsVC"), object: nil)
    }
    
    private func setUpConstraints() {
        
        qutoesDetailsLabel.snp.makeConstraints {
            $0.top.bottom.right.left.equalToSuperview()
        }
        
        readMoreButton.snp.makeConstraints {
            $0.right.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(3)
        }
    }
}

// MARK:- Protocols
public protocol QuotesDetailsTableViewCellConfigurable {}


// MARK:- View model
class QuotesDetailsTableViewCellViewModel: QuotesDetailsTableViewCellConfigurable {}
