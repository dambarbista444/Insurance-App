//
//  DashboardVC.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 8/23/21.
//

import UIKit
import Profile
import PopUp


class DashboardVC: UIViewController {
    
    
    let navigationBar: UINavigationBar = {
        
        let navBarWidth = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 25, width: navBarWidth.width, height: 40))
        
        let profileButton = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: #selector(navigateToProfileVC))
        
        let navItem = UINavigationItem(title: "DASHBOARD")
        
        navItem.rightBarButtonItem = profileButton
        navBar.setItems([navItem], animated: false)
        
        return navBar
    }()
    
    private let dashboardTableView: UITableView = {
        let tableView = UITableView()
        tableView.registerCell(cellType: UpcomingBillCell.self)
        tableView.registerCell(cellType: MyCardCell.self)
        tableView.registerCell(cellType: ReportAndRequestCell.self)
        tableView.registerCell(cellType: ContactAgentCell.self)
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    private let viewModel: DashboardViewConfigurable
    
    init(viewModel: DashboardViewConfigurable) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        addViews()
        setUpConstraints()
        dashboardTableView.delegate = self
        dashboardTableView.dataSource = self
    
        
    }
    
    
    private func addViews() {
        
        self.view.addSubview(navigationBar)
        self.view.addSubview(dashboardTableView)
    }
    
    
    private func setUpConstraints() {
        
        dashboardTableView.snp.makeConstraints { make in
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


// MARK:- TableView Datasource and Delegate

extension DashboardVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.numberOfRowsPerSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let row = viewModel.row(for: indexPath) else { return UITableViewCell() }
        
        switch row {
        case let .upcomingBillRow(cellViewModel):
            let cell: UpcomingBillCell = tableView.cell(for: indexPath)
            cell.configureCell(with: cellViewModel)
            return cell
            
        case  .myCardsRow(_):
            let cell: MyCardCell = tableView.cell(for: indexPath)
            return cell
            
        case let .reportAndRequestRow(cellViewModel):
            let cell: ReportAndRequestCell = tableView.cell(for: indexPath)
            cell.configureCell(with: cellViewModel)
            return cell
            
        case let .contactAgentRow(cellViewModel):
            let cell: ContactAgentCell = tableView.cell(for: indexPath)
            cell.configureCell(with: cellViewModel)
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(viewModel.heightForRowAt(indexPath: indexPath))
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
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
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
}
