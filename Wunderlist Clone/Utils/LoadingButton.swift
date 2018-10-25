//
//  LoadingButton.swift
//  Wunderlist Clone
//
//  Created by Alejandro Santoyo on 24/10/18.
//  Copyright © 2018 Alejandro Santoyo. All rights reserved.
//

import UIKit

class LoadingButton: UIButton {
    var originalButtonText: String?
    var activityIndicator: UIActivityIndicatorView!
    
    func showLoading() {
        self.isEnabled = false
        if (activityIndicator == nil) {
            activityIndicator = createActivityIndicator()
        }
        showSpinning()
    }
    
    func hideLoading() {
        self.isEnabled = true
        activityIndicator.stopAnimating()
    }
    
    private func createActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .white
        return activityIndicator
    }
    
    private func showSpinning() {
        self.addSubview(activityIndicator)
        centerActivityIndicatorInButton()
        activityIndicator.startAnimating()
    }
    
    private func centerActivityIndicatorInButton() {
        let buttonHeight = self.bounds.size.height
        let buttonWidth = self.bounds.size.width
        activityIndicator.center = CGPoint(x: buttonWidth - 32, y: buttonHeight/2)
    }
}
