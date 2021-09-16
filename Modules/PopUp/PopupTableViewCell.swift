//
//  PopupTableViewCell.swift
//  PopUp
//
//  Created by Dambar Bista on 9/14/21.
//

import UIKit
import WebKit
import SnapKit

class PopupTableViewCell: UITableViewCell, WKUIDelegate {
    
    let webView = WKWebView()
    let mainView = UIView() /// this view will hold stackviews
    
    /// Usage: to make table for pros and cons
    ///Views for rows- Horizontal
    let firstRowView = UIView()
    let secondRowView = UIView()
    let thirdRowView = UIView()
    /// Views for column - Vertical
    let verticalView = UIView()
    
    let prosAndConsLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.text = "Pros and cons of getting auto insurance quotes online"
        
        return label
    }()
    
    /// Pros Items
    let prosTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Pros"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    
    let firstProsLabel: UILabel = {
        let label = UILabel()
        label.text = "First pro is compare rate with other compinies"
        label.numberOfLines = 0
        
        return label
    }()
    
    let secondProsLabel: UILabel = {
        let label = UILabel()
        label.text = "Second pro is"
        return label
    }()
    
    let thirdProsLabel: UILabel = {
        let label = UILabel()
        label.text = "Third pro is"
        return label
    }()
    
    /// Cons items
    let consTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Cons"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    let firstConsLabel: UILabel = {
        let label = UILabel()
        label.text = "First cons is compare rate with other compinies"
        label.numberOfLines = 0
        return label
    }()
    
    let secondConsLabel: UILabel = {
        let label = UILabel()
        label.text = "Second cons is"
        return label
    }()
    
    let thirdConsLabel: UILabel = {
        let label = UILabel()
        label.text = "Third cons is"
        return label
    }()
    
    /// StackViews
    
    lazy var prosAndConsTitleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .horizontal
        stackView.spacing = 30
        
        [prosTitleLabel, consTitleLabel].forEach{stackView.addArrangedSubview($0)}
        
        return stackView
    }()
    
    
    lazy var prosListStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        
        [ firstProsLabel, secondProsLabel, thirdProsLabel ].forEach{stackView.addArrangedSubview($0)}
        
        return stackView
    }()
    
    lazy var consListStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        
        [ firstConsLabel, secondConsLabel, thirdConsLabel ].forEach{stackView.addArrangedSubview($0)}
        
        return stackView
    }()
    
    
    lazy var mainVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        [prosListStackView, consListStackView ].forEach{stackView.addArrangedSubview($0)}
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addViews()
        setUpConstraint()
        webView.uiDelegate = self
        loadHtmlFile()
        setupView()
    }
    
    private func setupView() {
        mainView.layer.borderWidth = 2
        mainView.layer.borderColor = UIColor.black.cgColor
        
        firstRowView.backgroundColor = .black
        secondRowView.backgroundColor = .black
        thirdRowView.backgroundColor = .black
        verticalView.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadHtmlFile() {
        
        let filePath = Bundle.main.path(forResource: "vehicleInsurance", ofType: "html")
        let url = URL(fileURLWithPath: filePath!)
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    
    private func addViews() {
        contentView.addSubview(webView)
        contentView.addSubview(prosAndConsLabel)
        contentView.addSubview(mainView)
        mainView.addSubview(prosAndConsTitleStackView)
        mainView.addSubview(mainVerticalStackView)
        mainView.addSubview(firstRowView)
        mainView.addSubview(secondRowView)
        mainView.addSubview(thirdRowView)
        mainView.addSubview(verticalView)
    }
    
    
    private func setUpConstraint() {
        
        webView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.right.equalToSuperview().inset(10)
            $0.height.equalTo(490)
        }
        
        prosAndConsLabel.snp.makeConstraints {
            $0.top.equalTo(webView.snp.bottom)
            $0.left.right.equalToSuperview().inset(10)
            $0.height.equalTo(20)
        }
        
        mainView.snp.makeConstraints {
            $0.top.equalTo(prosAndConsLabel.snp.bottom).offset(10)
            $0.left.right.equalToSuperview().inset(10)
            $0.height.equalTo(280)
        }
        
        prosAndConsTitleStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.left.right.equalToSuperview().inset(50)
            $0.height.equalTo(40)
        }
        
        mainVerticalStackView.snp.makeConstraints {
            $0.top.equalTo(prosAndConsTitleStackView.snp.bottom)
            $0.bottom.left.right.equalToSuperview().inset(5)
        }
        
        prosListStackView.snp.makeConstraints {
            $0.width.equalTo(contentView.frame.size.width/2)
        }
        
        firstRowView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(2)
        }
        
        secondRowView.snp.makeConstraints {
            $0.top.equalTo(firstRowView.snp.bottom).offset(80)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        thirdRowView.snp.makeConstraints {
            $0.top.equalTo(secondRowView.snp.bottom).offset(80)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        verticalView.snp.makeConstraints {
            $0.left.equalTo(prosListStackView.snp.right)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(1)
            
            
        }
    }
    
}


// MARK:- Protocals and View model

public protocol PopupTableViewCellConfigurable {
    var vehicleDetails: VehicleInsuranceQuotesDetails? { get }
}

class PopupTableViewCellViewModel: PopupTableViewCellConfigurable {
    var vehicleDetails: VehicleInsuranceQuotesDetails?
    
    init(vehicleDetails: VehicleInsuranceQuotesDetails) {
        self.vehicleDetails = vehicleDetails
    }
    
    
}
