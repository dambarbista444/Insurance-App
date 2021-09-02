//
//  PolicyVC.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 8/25/21.
//

import UIKit
import SnapKit
import Profile

class PolicyVC: UIViewController {
    

    let navigationBar: UINavigationBar = {
        
        let navBarWidth = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 25, width: navBarWidth.width, height: 40))
        
        let profileButton = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: #selector(navigateToProfileVC))
        
        let navItem = UINavigationItem(title: "Policy")
        
        navItem.rightBarButtonItem = profileButton
        navBar.setItems([navItem], animated: false)
        
        return navBar
    }()
    
   private let tableView: UITableView = {
        let table = UITableView()
        table.register(AutoCell.self, forCellReuseIdentifier: "autoCell")
        table.register(HomeOrRentalCell.self, forCellReuseIdentifier: "homeCell")
        table.register(ReportOrRequestCell.self, forCellReuseIdentifier: "documentsCell")
       
        table.translatesAutoresizingMaskIntoConstraints = false
        table.showsVerticalScrollIndicator = false
        return table
    }()
    
    
    var documents = ["Auto", "Life", "House"]
    var vehicles = ["2012 Nissan Altima", "2000 BMW"]
    

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
        navigationController?.pushViewController(profileVC, animated: true)
    }
    

   
}

extension PolicyVC: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case PolicySection.auto:
            return 2

        case PolicySection.HomeOrRental:
            return 1

        case PolicySection.documents:
            return 3

        default:
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {

        case PolicySection.auto:
            let autoCell = tableView.dequeueReusableCell(withIdentifier: "autoCell",for: indexPath) as! AutoCell
            autoCell.carModel.text = vehicles[indexPath.row]
            return autoCell
                                        // later change cell id
        case PolicySection.HomeOrRental:
            let homeCell = tableView.dequeueReusableCell(withIdentifier: "homeCell",for: indexPath) as! HomeOrRentalCell
            return homeCell

        case PolicySection.documents:
                /// I am reusing this report and requestCell  becuse documents and report or request have same  contents are same
            let documentsCell = tableView.dequeueReusableCell(withIdentifier: "documentsCell",for: indexPath) as! ReportOrRequestCell
            documentsCell.reportOrRequestLablel.text = documents[indexPath.row]

            return documentsCell

        default:
            return UITableViewCell()
        }
    }



    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        switch indexPath.section {
        case PolicySection.auto:
            return 100

        case PolicySection.HomeOrRental:
            return 120

        case PolicySection.documents:
            return 40

        default:
            return 60
        }
    }


    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let sectionTitles = ["AUTO", "HOME/RENTAL","DOCUMENTS" ]
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
