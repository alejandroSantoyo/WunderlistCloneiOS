//
//  RegisterViewController.swift
//  Wunderlist Clone
//
//  Created by Alejandro Santoyo on 23/10/18.
//  Copyright © 2018 Alejandro Santoyo. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onRegisterPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "iOS Alert", message: "Native alert", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.show(alert, sender: nil)
    }
    
}
