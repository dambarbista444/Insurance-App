//
//  ReuseableItems.swift
//  Alamofire
//
//  Created by Dambar Bista on 9/1/21.
//

import Foundation
import UIKit


extension UITextField {
    
    open func reuseableTextfield(placeholder text: String, heightConstant: CGFloat, widthConstant: CGFloat) {
        
        self.placeholder = text
        self.backgroundColor = .cyan
        self.heightAnchor.constraint(equalToConstant: heightConstant).isActive = true
        self.widthAnchor.constraint(equalToConstant: widthConstant).isActive = true
        self.setContentHuggingPriority(.defaultLow, for: .horizontal)
        self .translatesAutoresizingMaskIntoConstraints = false
    }
}



 extension UILabel {
    
   public  func reuseableLabel(text: String, textAlignment: NSTextAlignment, heightConstant: CGFloat, widthConstant: CGFloat, fontSize: CGFloat)  {
        
        self.text = text
        self.font = .systemFont(ofSize: fontSize)
        self.textAlignment = textAlignment
        self.heightAnchor.constraint(equalToConstant: heightConstant).isActive = true
        self.widthAnchor.constraint(equalToConstant: widthConstant).isActive = true
        self.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
