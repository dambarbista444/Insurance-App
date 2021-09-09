//
//  QuotesDetailsVC.swift
//  Quotes
//
//  Created by Dambar Bista on 9/7/21.
//

import UIKit
import SnapKit

class QuotesDetailsVC: UIViewController {
    
    let contentView = UIView()
    
    let qutoesDetailsLabel: UILabel =  {
        let label = UILabel()
        label.text = "helllo worldLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.helllo worldLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.helllo worldLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.labore et dolore magna aliqua aliqe. helllo worldLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.helllo worldLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.helllo worldLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.labore et dolore magna aliqua aliqe..."
        label.numberOfLines = 0
        return label
    }()
    
    
    private let dismissButton: UIButton = {
        let button = UIButton()
        
        button.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        
        addViews()
        setUpConstraint()
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 15
    }
    
    
    private func addViews() {
        
        self.view.addSubview(dismissButton)
        dismissButton.addSubview(contentView)
        contentView.addSubview(qutoesDetailsLabel)
    }
    
    
    private func setUpConstraint() {
        
        dismissButton.snp.makeConstraints {
            $0.right.left.top.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.left.equalTo(dismissButton.snp.left).offset(30)
            $0.right.equalTo(dismissButton.snp.right).offset(-30)
            $0.top.equalTo(dismissButton.snp.top).offset(100)
            $0.bottom.equalTo(dismissButton.snp.bottom).offset(-200)
        }
        
        qutoesDetailsLabel.snp.makeConstraints {
            $0.right.left.top.bottom.equalToSuperview().inset(10)
        }
    }
    
    
    @objc private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
    
}
