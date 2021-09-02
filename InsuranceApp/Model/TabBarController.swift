//
//  TabBarController.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 8/23/21.
//

import UIKit
import Profile


class TabBarController: UITabBarController {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTabsbarControllers()
    
    }
    
    
    private func setUpTabsbarControllers() {
        
        let dashboardVC = DashboardVC()
        dashboardVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house.fill"), tag: 0)
        
        let policyVC = PolicyVC()
        policyVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "folder.fill"), tag: 1)
        
        let fourVC = LinkedInVC()
        fourVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "bag.fill"), tag: 2)
        
        let fiveVC = FiveVC()
        fiveVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "bell.fill"), tag: 3)
        
        
        let viewControllerList = [dashboardVC, policyVC, fourVC, fiveVC]
        viewControllers = viewControllerList
    }
    
}



