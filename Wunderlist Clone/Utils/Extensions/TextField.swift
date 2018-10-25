//
//  TextField.swift
//  Wunderlist Clone
//
//  Created by Alejandro Santoyo on 23/10/18.
//  Copyright © 2018 Alejandro Santoyo. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func paddingLeft(padding: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.height))
        
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
}
