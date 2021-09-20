//
//  ReuseableUIView.swift
//  PopUp
//
//  Created by Dambar Bista on 9/14/21.
//

import Foundation

// Reuseable view to give border color
extension UIView {
    
    func addBorderWidthColor(x: CGFloat, y: CGFloat, color: UIColor, width: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.frame = CGRect(x: x, y: y, width: width, height: 1)
        self.addSubview(border)
    }
}
