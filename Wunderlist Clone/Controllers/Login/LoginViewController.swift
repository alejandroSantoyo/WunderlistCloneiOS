//
//  LoginViewController.swift
//  Wunderlist Clone
//
//  Created by Alejandro Santoyo on 23/10/18.
//  Copyright © 2018 Alejandro Santoyo. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var buttonRegister: UIButton!
    @IBOutlet weak var buttonLogin: LoadingButton!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var viewInputs: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonRegister.roundedView(boderColor: UIColor(rgb: 0xc2c2c2).cgColor, borderWidth: 1, cornerRadius: 5)
        buttonLogin.roundedView(boderColor: UIColor.black.cgColor, borderWidth: 0, cornerRadius: 5)
        viewContainer.roundedView(boderColor: UIColor.black.cgColor, borderWidth: 0, cornerRadius: 5)
        viewInputs.roundedView(boderColor: UIColor(rgb: 0xdedede).cgColor, borderWidth: 0.5, cornerRadius: 5)
        
        textFieldEmail.paddingLeft(padding: 15)
        textFieldPassword.paddingLeft(padding: 15)
        textFieldEmail.setBottomLine(color: UIColor(rgb: 0xc2c2c2))
        self.navigationController?.navigationBar.isHidden = true
        buttonLogin.isEnabled = false
        buttonLogin.backgroundColor = UIColor(rgb: 0x4285F4).withAlphaComponent(0.5)
        
        textFieldEmail.addTarget(self, action: #selector(onTextChange(_:)), for: .editingChanged)
        textFieldPassword.addTarget(self, action: #selector(onTextChange(_:)), for: .editingChanged)
        
    }
    
    @objc func onTextChange(_ textField: UITextField) {
        if !textFieldEmail.text!.isEmpty && !textFieldPassword.text!.isEmpty {
            buttonLogin.isEnabled = true
            buttonLogin.backgroundColor = UIColor(rgb: 0x4285F4)
        } else {
            buttonLogin.isEnabled = false
            buttonLogin.backgroundColor = UIColor(rgb: 0x4285F4).withAlphaComponent(0.5)
        }
    }
    

    @IBAction func onLoginPressed(_ sender: UIButton) {
        buttonLogin.showLoading()
        view.endEditing(true)
        let json = [ "email": textFieldEmail.text!, "password": textFieldPassword.text! ]
        let headers = [ "Content-Type": "application/json" ]
        Alamofire.request("\(Constants.base_url)/login", method: .post, parameters: json, encoding: JSONEncoding.default , headers: headers).responseJSON {
            response in
            switch response.result {
                case .success(let data):
                    if let responseJSON = data as? NSDictionary {
                        if let _ = responseJSON["error"] as? String {
                            let alert = Alert.errorAlert(title: "Wunderlist Clone", message: "El correo electrónico o la contraseña son incorrectos. Vuelve a intentarlo.", cancelButton: false, completion: {
                                self.buttonLogin.hideLoading()
                            })
                            self.present(alert, animated: true, completion: nil)
                        }
                    }
                    self.buttonLogin.hideLoading()
                case .failure(let error):
                    self.buttonLogin.hideLoading()
                    if error.localizedDescription == "The Internet connection appears to be offline." {
                        let alert = Alert.errorAlert(title: "Wunderlist Clone", message: "Parece que no estás conectado a internet. Comprueba tu conexión y vuelve a intentarlo.", cancelButton: false, completion: nil)
                        self.present(alert, animated: true, completion: nil)
                    }
            }
        }
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
