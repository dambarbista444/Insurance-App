//
//  AutoDetailsTableViewCell.swift
//  PopUp
//
//  Created by Dambar Bista on 9/16/21.
//

import UIKit
import SnapKit

class AutoDetailsTableViewCell: UITableViewCell {
    
    let autoModelLabel: UILabel = {
        let label = UILabel()
        label.text = "2012 Nissan Altima"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    let autoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "vehicleImg.jpeg")
        return imageView
    }()
    
    let autoDetails: UILabel = {
        let label = UILabel()
        label.text = "Nissan Altima: ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.helllo worldLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.helllo worldLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.labore et dolore magna aliqua aliqe..."
        label.numberOfLines = 0
        return label
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
        contentView.addSubview(autoModelLabel)
        contentView.addSubview(autoImageView)
        contentView.addSubview(autoDetails)
    }
    
    
    private func setupViews() {
        autoImageView.layer.cornerRadius = 15
        autoImageView.layer.masksToBounds = true
    }
    
    
    private func setUpCosntraint() {
        
        autoModelLabel.snp.makeConstraints {
            $0.top.left.right.equalToSuperview().inset(10)
            $0.height.equalTo(30)
        }
        
        autoImageView.snp.makeConstraints {
            $0.top.equalTo(autoModelLabel.snp.bottom).offset(10)
            $0.left.right.equalToSuperview().inset(10)
            $0.height.equalTo(200)
        }
        
        autoDetails.snp.makeConstraints {
            $0.top.equalTo(autoImageView.snp.bottom).offset(10)
            $0.left.right.equalToSuperview().inset(10)
            $0.height.equalTo(200)
           
        }

    }
}

// MARK:- Protocols and ModelView

public protocol AutoDetailsTableViewCellConfigurable { }

class AutoDetailsTableViewCellViewModel: AutoDetailsTableViewCellConfigurable { }
