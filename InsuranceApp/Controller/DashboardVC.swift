//
//  DashboardVC.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 8/23/21.
//

import UIKit

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
    
    var tableView: UITableView = {
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
        configureItemsFromExtesion()
        setUpConstraints()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    private func addViews() {
        
        self.view.addSubview(navigationBar)
        self.view.addSubview(tableView)
    }
    
    
    private func configureItemsFromExtesion() {
        
    }
    
    @objc private func navigateToProfileVC() {
        let profileVC = ProfileVC()
        profileVC.modalPresentationStyle = .fullScreen
        profileVC.modalTransitionStyle = .flipHorizontal
        self.present(profileVC, animated: true)
    }

}


extension DashboardVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 2
        case 3:
            return 1
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.section {
        case 0:
            let billCell = tableView.dequeueReusableCell(withIdentifier: "billCell",for: indexPath) as! UpcomingBillCell
            return billCell
            
        case 1:
            let myIDCell = tableView.dequeueReusableCell(withIdentifier: "myIdCell",for: indexPath) as! MyCardCell
            return myIDCell
            
        case 2:
            let reportCell = tableView.dequeueReusableCell(withIdentifier: "reportCell",for: indexPath) as! ReportOrRequestCell
            reportCell.reportOrRequestLablel.text = reportItems[indexPath.row]
            return reportCell
            
        case 3:
            let contactCell = tableView.dequeueReusableCell(withIdentifier: "contactCell",for: indexPath) as! ContactAgentCell
            return contactCell
            
        default:
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 200
        case 1:
            return 260
        case 2:
            return 40
        case 3:
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
