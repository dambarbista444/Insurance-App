//
//  DashboardVC.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 8/23/21.
//

import UIKit
import Profile

class DashboardVC: UIViewController {
    
    
    let reportItems = ["Roadside assistance report", "Report accident"]
    
    let navigationBar: UINavigationBar = {
        
        let navBarWidth = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 25, width: navBarWidth.width, height: 40))
        
        let profileButton = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: #selector(navigateToProfileVC))
        
        let navItem = UINavigationItem(title: "DASHBOARD")
        
        navItem.rightBarButtonItem = profileButton
        navBar.setItems([navItem], animated: false)
        
        return navBar
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(ReportOrRequestCell.self, forCellReuseIdentifier: "reportCell")
        table.register(UpcomingBillCell.self, forCellReuseIdentifier: "billCell")
        table.register(MyCardCell.self, forCellReuseIdentifier: "myIdCell")
        table.register(ContactAgentCell.self, forCellReuseIdentifier: "contactCell")
        table.translatesAutoresizingMaskIntoConstraints = false
        table.showsVerticalScrollIndicator = false
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        addViews()
        setUpConstraints()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    private func addViews() {
        
        self.view.addSubview(navigationBar)
        self.view.addSubview(tableView)
    }
    
    
    private func setUpConstraints() {
        
        tableView.snp.makeConstraints { make in
            
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
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case DashboardSection.upComingBill:
            return 1
        case DashboardSection.myCards:
            return 1
        case DashboardSection.reportOrRequest:
            return 2
        case DashboardSection.contactAgent:
            return 1
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.section {
        case DashboardSection.upComingBill:
            let billCell = tableView.dequeueReusableCell(withIdentifier: "billCell",for: indexPath) as! UpcomingBillCell
            return billCell
            
        case DashboardSection.myCards:
            let myCardCell = tableView.dequeueReusableCell(withIdentifier: "myIdCell",for: indexPath) as! MyCardCell
            return myCardCell
            
        case DashboardSection.reportOrRequest:
            let reportCell = tableView.dequeueReusableCell(withIdentifier: "reportCell",for: indexPath) as! ReportOrRequestCell
            reportCell.reportOrRequestLablel.text = reportItems[indexPath.row]
            return reportCell
            
        case DashboardSection.contactAgent:
            let contactCell = tableView.dequeueReusableCell(withIdentifier: "contactCell",for: indexPath) as! ContactAgentCell
            return contactCell
            
        default:
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case DashboardSection.upComingBill:
            return 200
        case DashboardSection.myCards:
            return 260
        case DashboardSection.reportOrRequest:
            return 40
        case DashboardSection.contactAgent:
            return 120
        default:
            return 40
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sectionTitles = ["Upcoming Bills", "My Cards","Report/Request","Contact Agnet", ]
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
