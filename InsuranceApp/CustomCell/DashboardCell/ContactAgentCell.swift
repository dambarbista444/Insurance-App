//
//  ContactAgentCell.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 8/24/21.
//

import SnapKit

class ContactAgentCell: UITableViewCell {
    
    var agentImage = UIImageView()
    var nameLabel = UILabel()
    var phoneNumLabel = UILabel()
    var emailLabel = UILabel()
    
    
    lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .top
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        [self.nameLabel,self.emailLabel ,self.phoneNumLabel].forEach {
            stackView.addArrangedSubview($0)
            
        }
        return stackView
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let mainView = UIView()// view which hold stackview
        addViews(view: mainView)
        setUpConstraints(view: mainView)
        agentImage.layer.cornerRadius = 10
        agentImage.clipsToBounds = true
        configureItemFromExtension()
    }
    
    
    private func configureItemFromExtension() {
        
        agentImage.reuseableImageView(image: UIImage(named: "agentImg.jpg")!)
        nameLabel.reuseableLabel(text: "Joe Biden", textAlignment: .left, heightConstant: 20, widthConstant: contentView.frame.width - 40, fontSize: 18)
        emailLabel.reuseableLabel(text: "joebiden@email.com", textAlignment: .left, heightConstant: 20, widthConstant: contentView.frame.width - 40, fontSize: 18)
        
        phoneNumLabel.reuseableLabel(text: "Phone: 444-444-4444", textAlignment: .left, heightConstant: 20, widthConstant: contentView.frame.width - 40, fontSize: 18)
    }
    
    
    private func addViews(view: UIView) {
        contentView.addSubview(agentImage)
        view.addSubview(verticalStackView)
        contentView.addSubview(view)
        
    }
    
    
    private func setUpConstraints(view: UIView) {
        
        agentImage.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.left.equalTo(contentView.snp.left).offset(20)
            make.bottom.equalTo(contentView.snp.bottom).offset(-20)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        
        view.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.left.equalTo(agentImage.snp.right).offset(20)
            make.right.equalTo(contentView.snp.right).offset(-20)
            make.bottom.equalTo(contentView.snp.bottom).offset(-20)
        }
        
        verticalStackView.frame = view.frame
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
