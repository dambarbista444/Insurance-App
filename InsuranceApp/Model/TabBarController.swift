//
//  TabBarController.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 8/23/21.
//

import UIKit
import Profile
import Quotes



class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTabsbarControllers()
    
    }
    
    
    private func setUpTabsbarControllers() {
        
        let dashboardVC = DashboardVC(viewModel: DashboardViewModel())
        dashboardVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house.fill"), tag: 0)
        
        let policyVC = PolicyVC(viewModel: PolicyViewModel())
        policyVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "folder.fill"), tag: 1)
        
        let fourVC = LinkedInVC()
        fourVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "bag.fill"), tag: 2)
        
        let quotesVC = QuotesVC(viewModel: QuotesViewModel())
        quotesVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "bell.fill"), tag: 3)
        
        
        let viewControllerList = [dashboardVC, policyVC, fourVC, quotesVC]
        viewControllers = viewControllerList
    }
    
}



