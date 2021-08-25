//
//  TabBarController.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 8/23/21.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTabsbarControllers()
    }
    
    
    private func setUpTabsbarControllers() {
        
        let dashboardVC = DashboardVC()
        dashboardVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house.fill"), tag: 0)
    
        
        let viewControllerList = [dashboardVC]
        viewControllers = viewControllerList
    }
}
