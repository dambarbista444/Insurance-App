//
//  ProfileCell.swift
//  iOSTrainingProject2 - Dambar
//
//  Created by Dambar Bista on 8/16/21.
//

import UIKit

class ProfileCardCell: UITableViewCell {
    
    let nameLabel = UILabel()
    let idLabel = UILabel()
    let userIdlabel = UILabel()
    let phoneNumberLabel = UILabel()
    let emailLabel = UILabel()
    
    let profileImageView: UIImageView = {
       let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
       imageView.image = UIImage(named: "pncLogo.jpeg")
       imageView.translatesAutoresizingMaskIntoConstraints = false
       
       return imageView
   }()
    
    lazy var nameLabelView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .top
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        [self.nameLabel].forEach {
            stackView.addArrangedSubview($0)

        }
        
        return stackView
    }()
    
    lazy var phoneAndEmailView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        [self.phoneNumberLabel,self.emailLabel].forEach {
            stackView.addArrangedSubview($0)

        }
        
        return stackView
    }()
    
    lazy var idAndUserIDView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        [self.idLabel,self.userIdlabel].forEach {
            stackView.addArrangedSubview($0)

        }
        
        return stackView

    }()
    
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let mainView = UIView()
        
        addViews(view: mainView)
        setUpConstraints(view: mainView)
    
        nameLabel.setUpLabel(text: "Dambar Bista", textAlignment: .center, heightConstant: 40, widthConstant: 200, fontSize: 18)
        idLabel.setUpLabel(text: "M000034", textAlignment: .left, heightConstant: 40, widthConstant: 200, fontSize: 18)
        userIdlabel.setUpLabel(text: "dambar444", textAlignment: .left, heightConstant: 40, widthConstant: 200, fontSize: 18)
        phoneNumberLabel.setUpLabel(text: "444-555-6666", textAlignment: .left, heightConstant: 40, widthConstant: 200, fontSize: 18)
        emailLabel.setUpLabel(text: "abc@email.com", textAlignment: .left, heightConstant: 40, widthConstant: 200, fontSize: 18)
    }
    
    
    private func addViews(view: UIView) {
        contentView.addSubview(view)
        
        view.addSubview(nameLabelView)
        view.addSubview(phoneAndEmailView)
        view.addSubview(idAndUserIDView)
        view.addSubview(profileImageView)
    }
    
    
    func setUpConstraints(view: UIView) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        nameLabelView.topAnchor.constraint(equalTo: view.topAnchor,constant: 10).isActive = true
        nameLabelView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10).isActive = true
        nameLabelView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 10).isActive = true
        
        profileImageView.topAnchor.constraint(equalTo: nameLabelView.topAnchor,constant: 10).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10).isActive = true
        profileImageView.trailingAnchor.constraint(equalTo: idAndUserIDView.leadingAnchor,constant: 10).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        idAndUserIDView.topAnchor.constraint(equalTo: nameLabelView.topAnchor,constant: 10 ).isActive = true
        idAndUserIDView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor,constant: 20).isActive = true
        idAndUserIDView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10).isActive = true
        idAndUserIDView.bottomAnchor.constraint(equalTo: phoneAndEmailView.topAnchor,  constant: -20).isActive = true
        
        phoneAndEmailView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor,constant: 15).isActive = true
        phoneAndEmailView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10).isActive = true
        phoneAndEmailView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10).isActive = true
        phoneAndEmailView.bottomAnchor.constraint(equalTo: view.bottomAnchor,  constant: -5).isActive = true
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
