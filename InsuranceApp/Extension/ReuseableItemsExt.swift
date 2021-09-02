//
//  TextFieldModel.swift
//  iOSTrainingProject2 - Dambar
//
//  Created by Dambar Bista on 8/15/21.
//

import Foundation
import UIKit

/* Here I am creating the extension of UITextField and UILable to use this everywhere in project, so i don't have define everytime and make our code lot less
 */
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


public extension UILabel {
    
     func reuseableLabel(text: String, textAlignment: NSTextAlignment, heightConstant: CGFloat, widthConstant: CGFloat, fontSize: CGFloat)  {
        
        self.text = text
        self.font = .systemFont(ofSize: fontSize)
        self.textAlignment = textAlignment
        self.heightAnchor.constraint(equalToConstant: heightConstant).isActive = true
        self.widthAnchor.constraint(equalToConstant: widthConstant).isActive = true
        self.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}


extension UILabel {
    
    open func reuseableBoldTextLabel(text: String, textAlignment: NSTextAlignment, heightConstant: CGFloat, widthConstant: CGFloat, fontSize: CGFloat)  {
        
        self.text = text
        self.font = .boldSystemFont(ofSize: fontSize)
        self.textAlignment = textAlignment
        self.heightAnchor.constraint(equalToConstant: heightConstant).isActive = true
        self.widthAnchor.constraint(equalToConstant: widthConstant).isActive = true
        self.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}



extension UIImageView {
    
    open func reuseableImageView(image: UIImage) {
        self .image = image
      self.translatesAutoresizingMaskIntoConstraints = false
    }
}


extension UIView {
    
    open func reuseableView(height: CGFloat, width: CGFloat, color: UIColor?) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = color
        
    }
}


extension UIStackView {
    
    open func reuseableStackview(axis: NSLayoutConstraint.Axis, alignment: UIStackView.Alignment, distribution: UIStackView.Distribution, spacing: CGFloat, arrangedSubviews: [UIView]) {
        
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false

        arrangedSubviews.forEach { self.addArrangedSubview($0)}
    }
}
