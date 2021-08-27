//
//  FourVC.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 8/25/21.
//

import UIKit

class LinkedInVC: UIViewController {
    

    let navigationBar: UINavigationBar = {
        
        let navBarWidth = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 25, width: navBarWidth.width, height: 40))
        let navItem = UINavigationItem(title: "LinkedIn")
        navBar.setItems([navItem], animated: false)
        
        return navBar
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(LinkedInCell.self, forCellReuseIdentifier: "linkedinCell")
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
}

extension LinkedInVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LinkedIn.newsFeed
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "linkedinCell",for: indexPath) as! LinkedInCell
        cell.selectionStyle = .none
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
       
}

