//
//  QuotesDetailsVC.swift
//  Quotes
//
//  Created by Dambar Bista on 9/7/21.
//

import UIKit
import SnapKit
import TableViewReuseableCell

public class PopupVC: UIViewController {
    
    private let viewModel: PopupViewConfigurable
    
    public init(viewModel: PopupViewConfigurable) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
     let PopupTableView: UITableView = {
        let tableView = UITableView()
        tableView.registerCell(cellType: AutoInsuranceQuotesDetailsTableViewCell.self)
        tableView.registerCell(cellType: AutoDetailsTableViewCell.self)
        tableView.layer.cornerRadius = 15
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        
        return tableView
    }()
    
   
    public override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        setUpConstraint()
        PopupTableView.delegate = self
        PopupTableView.dataSource = self
        view.backgroundColor = .clear
    }
    
    
    private func addViews() {
        self.view.addSubview(PopupTableView)
    }
    

    private func setUpConstraint() {
        
        PopupTableView.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(35)
            $0.top.equalTo(view.snp.top).offset(60)
            $0.bottom.equalTo(view.snp.bottom).offset(-100)
        }
    }
}


// MARK:- TableView Data source and Delegate
extension PopupVC: UITableViewDelegate, UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsForSection(section: section)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
            guard let row = viewModel.row(for: indexPath) else { return UITableViewCell() }
       
            switch row {
            case .autoInsuranceQuotesDetailsRow(_):
               
                    let cell: AutoInsuranceQuotesDetailsTableViewCell = tableView.cell(for: indexPath)
                    return cell
                
            case .autoDetailsRow(_):
                let cell: AutoDetailsTableViewCell = PopupTableView.cell(for: indexPath)
                return cell
            }
    }
    
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 800
    }
    
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerTitleLabel = UILabel(frame: CGRect(x: 0, y: 5, width: PopupTableView.frame.width, height: 40))
        headerTitleLabel.text = viewModel.titleForHeader
        headerTitleLabel.font = .boldSystemFont(ofSize: 18)
        headerTitleLabel.textAlignment = .center
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: PopupTableView.frame.width, height: 40))
        headerView.addBorderWidthColor(x: 0, y: 40, color: .gray, width: PopupTableView.frame.width)
        
        headerView.addSubview(headerTitleLabel)
        
        return headerView
    }
    
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(40)
    }
    
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat(80)
    }
    
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let dismissPopoutButton = UIButton()
        dismissPopoutButton.setTitle(viewModel.titleForButton, for: .normal)
        dismissPopoutButton.backgroundColor = .black
        dismissPopoutButton.layer.cornerRadius = 15
        //dismissPopoutButton.addTarget(self, action: #selector(dismissPopout), for: .touchUpInside)
        
        if #available(iOS 14.0, *) {
            dismissPopoutButton.addAction(viewModel.popoutButtonAction(vc: self), for: .touchUpInside)
        } else {
            // Fallback on earlier versions
        }
        
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: PopupTableView.frame.width, height: 80))
        footerView.addSubview(dismissPopoutButton)
        
        /// SetupButtonView
        dismissPopoutButton.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(40)
            $0.top.equalTo(footerView.snp.top).offset(20)
            $0.height.equalTo(40)
        }
        
        return footerView
    }
    
    
   @objc func dismissPopout() {
        dismiss(animated: true, completion: nil)
    }
    
    
}




