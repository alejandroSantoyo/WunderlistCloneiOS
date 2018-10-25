//
//  RegisterViewController.swift
//  Wunderlist Clone
//
//  Created by Alejandro Santoyo on 23/10/18.
//  Copyright © 2018 Alejandro Santoyo. All rights reserved.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController {

    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var viewInputs: UIView!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var buttonRegister: LoadingButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldName.setBottomLine(color: UIColor(rgb: 0xc2c2c2))
        textFieldEmail.setBottomLine(color: UIColor(rgb: 0xc2c2c2))
        viewInputs.roundedView(boderColor: UIColor(rgb: 0xdedede).cgColor, borderWidth: 0.5, cornerRadius: 5)
        
        textFieldName.paddingLeft(padding: 15)
        textFieldEmail.paddingLeft(padding: 15)
        textFieldPassword.paddingLeft(padding: 15)
    
        viewContainer.roundedView(boderColor: UIColor.black.cgColor, borderWidth: 0, cornerRadius: 5)
        buttonRegister.roundedView(boderColor: UIColor.black.cgColor, borderWidth: 0, cornerRadius: 5)
    }
    
    @IBAction func onRegisterPressed(_ sender: UIButton) {
        let (valid, json) = validateFields()
        if !valid { return }
        buttonRegister.showLoading()
        Alamofire.request("\(Constants.base_url)/users", method: .post, parameters: json, encoding: JSONEncoding.default, headers: ["Content-Type": "application/json"]).responseJSON {
            response in
            switch response.result {
                case .success(let data):
                    print(data)
                    if let response = data as? Dictionary<String,Any> {
                        if let _ = response["error"] as? String {
                            let alert = Alert.errorAlert(title: "Wunderlist Clone", message: "Ya existe una cuenta con esta dirección de correo electrónico", cancelButton: false, completion: { self.buttonRegister.hideLoading() });
                            self.present(alert, animated: true, completion: nil)
                        } else if let _ = response["status"] as? String {
                            self.buttonRegister.hideLoading()
                        }
                    }
                    break
                case .failure(let error):
                    self.buttonRegister.hideLoading()
                    print(error.localizedDescription)
            }
            print(response)
        }
        print(json)
    }
    
    func validateFields() -> (Bool, Dictionary<String, String>) {
        let email = textFieldEmail.text!
        let password = textFieldPassword.text!
        let name = textFieldName.text!
        let json = ["email": email, "password": password, "name": name];
        if email.isEmpty || password.isEmpty || name.isEmpty {
            let alert = UIAlertController(title: "Escribe tu nombre completo", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cerrar", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return (false, [:])
        }
        return (true, json)
    }
    
}
