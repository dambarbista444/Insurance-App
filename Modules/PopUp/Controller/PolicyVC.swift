//
//  PolicyVC.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 8/25/21.
//

import UIKit
import SnapKit
import Profile

public class PolicyVC: UIViewController {
    

    let navigationBar: UINavigationBar = {
        
        let navBarWidth = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 35, width: navBarWidth.width, height: 40))
        
        let profileButton = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: #selector(navigateToProfileVC))
        
        let navItem = UINavigationItem(title: "Policy")
        
        navItem.rightBarButtonItem = profileButton
        navBar.setItems([navItem], animated: false)
        
        return navBar
    }()
    
     let PolicyTableView: UITableView = {
        let tableView = UITableView()
        tableView.registerCell(cellType: AutoTableViewCell.self)
        tableView.registerCell(cellType: HomeAndRentalCell.self)
        tableView.registerCell(cellType: DocumentsTableViewCell.self)
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    
    private let viewModel: PolicyViewConfigurable
    
    public init(viewModel: PolicyViewConfigurable) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        addViews()
        setUpConstraints()
        PolicyTableView.delegate = self
        PolicyTableView.dataSource = self
    }
    
  
    private func addViews() {
        
        self.view.addSubview(navigationBar)
        self.view.addSubview(PolicyTableView)
    }
    
    
    private func setUpConstraints() {
        
        PolicyTableView.snp.makeConstraints { make in
            
            make.top.equalTo(navigationBar.snp.bottom).offset(20)
            make.left.equalTo(view.snp.left).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
    
    
    @objc private func navigateToProfileVC() {
        
        let profileVC = ProfileVC()
        profileVC.modalPresentationStyle = .fullScreen
        present(profileVC, animated: true)
    }
}


// MARK:- TableView DataSource And Delegate
extension PolicyVC: UITableViewDelegate, UITableViewDataSource {

    public func numberOfSections(in tableView: UITableView) -> Int {
       
        return viewModel.numberOfSections
    }
    

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return viewModel.numberOfRowsPerSection(section: section)
    }
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard  let row = viewModel.row(for: indexPath) else { return UITableViewCell()}
        
        switch row {
        case let .autoRow(cellViewModel):
            let cell: AutoTableViewCell = tableView.cell(for: indexPath)
            cell.configureCell(with: cellViewModel)
            return cell
            
        case let .homeAndRentalRow(cellViewModel):
            let cell: HomeAndRentalCell = tableView.cell(for: indexPath)
            cell.configureCell(with: cellViewModel)
            return cell
            
        case let .documentsRow(cellViewModel):
            let cell: DocumentsTableViewCell = tableView.cell(for: indexPath)
            cell.configureCell(with: cellViewModel)
            return cell
        }
    }



    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return CGFloat(viewModel.heightForRowAt(indexPath: indexPath))
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let autoSectionIndex = 0
        let autoRow = 0
        
        if indexPath.section == autoSectionIndex,indexPath.row == autoRow {
            presentPopup(with: AutoDetailsPopupViewModel())
        }
    }
    
   private func presentPopup(with viewModel: PopupViewConfigurable) {
        let popupVC = PopupVC(viewModel: viewModel)
        present(popupVC, animated: true)
    }


    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let sectionTitles = viewModel.titleForHeaderInSection
        let headerTitleWidth = self.view.frame.width - 20
        let headerTitleLabel = UILabel(frame: CGRect(x: 0, y: 5, width: headerTitleWidth, height: 20))
        headerTitleLabel.text = sectionTitles[section]
        headerTitleLabel.font = .systemFont(ofSize: 20)
        headerTitleLabel.textAlignment = .center

        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: headerTitleWidth, height: 40))
        headerView.addSubview(headerTitleLabel)

        return headerView
    }
    
}

