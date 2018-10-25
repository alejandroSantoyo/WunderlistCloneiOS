//
//  UIView.swift
//  Wunderlist Clone
//
//  Created by Alejandro Santoyo on 23/10/18.
//  Copyright © 2018 Alejandro Santoyo. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func roundedView(boderColor: CGColor, borderWidth: CGFloat, cornerRadius: CGFloat) {
        self.layer.borderColor = boderColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
    }
    
    func bottomLine() {
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.gray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func setBottomLine(color: UIColor) {
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = color.withAlphaComponent(0.5).cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width * 2, height: self.frame.size.height)
        
        border.borderWidth = width
        
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
}
