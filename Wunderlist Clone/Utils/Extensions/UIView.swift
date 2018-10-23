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
    
}
