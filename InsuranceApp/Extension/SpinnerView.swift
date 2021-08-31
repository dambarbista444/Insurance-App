//
//  SpinnerView.swift
//  InsuranceApp
//
//  Created by Dambar Bista on 8/31/21.
//

import Foundation
import UIKit

var loadingView: UIView?

extension UIViewController {
    
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
    
    
    static func removeLoadingSpinner() {
        
        DispatchQueue.main.async {
            loadingView?.removeFromSuperview()
            loadingView = nil
        }
    }
}
