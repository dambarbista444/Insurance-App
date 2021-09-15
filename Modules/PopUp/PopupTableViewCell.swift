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
    
    
    lazy var mainVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .vertical
       // stackView.distribution = .fillProportionally
        stackView.spacing = 10
        
        [ ].forEach{stackView.addArrangedSubview($0)}
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addViews()
        setUpConstraint()
        webView.uiDelegate = self
        loadHtmlFile()
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
        //webView.addSubview(mainVerticalStackView)
        

    }
    
    private func setUpConstraint() {
        
        webView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.right.equalToSuperview().inset(10)
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
