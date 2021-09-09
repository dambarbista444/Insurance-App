//
//  ContactAgentCell.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 8/24/21.
//

import SnapKit

class ContactAgentCell: UITableViewCell {
    
    var agentImageView = UIImageView()
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
        agentImageView.layer.cornerRadius = 10
        agentImageView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func addViews(view: UIView) {
        contentView.addSubview(agentImageView)
        view.addSubview(verticalStackView)
        contentView.addSubview(view)
        
    }
    
    
    private func setUpConstraints(view: UIView) {
        
        agentImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.left.equalTo(contentView.snp.left).offset(20)
            make.bottom.equalTo(contentView.snp.bottom).offset(-20)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        
        view.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.left.equalTo(agentImageView.snp.right).offset(20)
            make.right.equalTo(contentView.snp.right).offset(-20)
            make.bottom.equalTo(contentView.snp.bottom).offset(-20)
        }
        
        verticalStackView.frame = view.frame
    }
    
    
    func configureCell(with viewModel: ContactAgentTableViewCellConfigurable) {
        
        guard let contactAgentItems = viewModel.contactAgentItems else { return }
        nameLabel.text = contactAgentItems.name
        emailLabel.text = contactAgentItems.email
        phoneNumLabel.text = contactAgentItems.phone
        agentImageView.image = contactAgentItems.agentImage
    }

}


// MARK:- Protocols

protocol ContactAgentTableViewCellConfigurable {
    var contactAgentItems: ContactAgentItems? { get }
}


// MARK:- View Model

class ContactAgentTableViewCellViewModel: ContactAgentTableViewCellConfigurable {
   
    var contactAgentItems: ContactAgentItems?
    
    init(contactAgentItems: ContactAgentItems) {
        self.contactAgentItems = contactAgentItems
    }
}
