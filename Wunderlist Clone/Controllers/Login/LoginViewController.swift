//
//  LoginViewController.swift
//  Wunderlist Clone
//
//  Created by Alejandro Santoyo on 23/10/18.
//  Copyright © 2018 Alejandro Santoyo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var buttonRegister: UIButton!
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var viewContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonRegister.roundedView(boderColor: UIColor.gray.cgColor, borderWidth: 1, cornerRadius: 5)
        buttonLogin.roundedView(boderColor: UIColor.black.cgColor, borderWidth: 0, cornerRadius: 5)
        viewContainer.roundedView(boderColor: UIColor.black.cgColor, borderWidth: 0, cornerRadius: 5)
        self.navigationController?.navigationBar.isHidden = true
    }
    

    @IBAction func onLoginPressed(_ sender: UIButton) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
