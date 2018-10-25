//
//  Constants.swift
//  Wunderlist Clone
//
//  Created by Alejandro Santoyo on 23/10/18.
//  Copyright © 2018 Alejandro Santoyo. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    static let host = "localhost:4000"
    static let base_url = "http://\(Constants.host)/api/v1"
    
}


struct Alert {
    static func errorAlert(title: String, message: String?, cancelButton: Bool = false, completion: (() -> Void)? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "OK", style: .default) {
            _ in
            guard let completion = completion else { return }
            completion()
        }
        alert.addAction(actionOK)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        if cancelButton { alert.addAction(cancel) }
        
        return alert
    }
}
