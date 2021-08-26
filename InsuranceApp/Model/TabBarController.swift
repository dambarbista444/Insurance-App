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
        
        let policyVC = PolicyVC()
        policyVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "folder.fill"), tag: 1)
        
        let fourVC = FourVC()
        fourVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "bag.fill"), tag: 2)
        
        let fiveVC = FiveVC()
        fiveVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "bell.fill"), tag: 3)
    
        
        let viewControllerList = [dashboardVC, policyVC, fourVC, fiveVC]
        viewControllers = viewControllerList
    }
    
    
    func showLoadingSpinner(on view: UIView) {
        
        let spinnerView = UIView.init(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        spinnerView.backgroundColor = UIColor(red: 0.75, green: 0.92, blue: 0.96, alpha: 1.0)
        let activityIndicator = UIActivityIndicatorView.init(style: .large)
        activityIndicator.startAnimating()
        activityIndicator.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(activityIndicator)
            view.addSubview(spinnerView)
        }
        
        loadingView = spinnerView
    }
    
    
    func removeLoadingSpinner() {
        
        DispatchQueue.main.async {
            loadingView?.removeFromSuperview()
            loadingView = nil
        }
    }
}
