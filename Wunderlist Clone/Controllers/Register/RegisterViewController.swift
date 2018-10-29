//
//  RegisterViewController.swift
//  Wunderlist Clone
//
//  Created by Alejandro Santoyo on 23/10/18.
//  Copyright © 2018 Alejandro Santoyo. All rights reserved.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var viewInputs: UIView!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var buttonRegister: LoadingButton!
    @IBOutlet weak var buttonAvatar: UIButton!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        textFieldName.setBottomLine(color: UIColor(rgb: 0xc2c2c2))
        textFieldEmail.setBottomLine(color: UIColor(rgb: 0xc2c2c2))
        viewInputs.roundedView(boderColor: UIColor(rgb: 0xdedede).cgColor, borderWidth: 0.5, cornerRadius: 5)
        
        textFieldName.paddingLeft(padding: 15)
        textFieldEmail.paddingLeft(padding: 15)
        textFieldPassword.paddingLeft(padding: 15)
    
        viewContainer.roundedView(boderColor: UIColor.black.cgColor, borderWidth: 0, cornerRadius: 5)
        buttonRegister.roundedView(boderColor: UIColor.black.cgColor, borderWidth: 0, cornerRadius: 5)
        buttonAvatar.roundedView(boderColor: UIColor.white.cgColor, borderWidth: 2, cornerRadius: buttonAvatar.frame.height / 2)
    }
    
    @IBAction func onRegisterPressed(_ sender: UIButton) {
        let (valid, json) = validateFields()
        if !valid { return }
        buttonRegister.showLoading()
        let headers = ["Content-Type": "application/json"]
        Alamofire.request("\(Constants.base_url)/users", method: .post, parameters: json, encoding: JSONEncoding.default, headers: headers).responseJSON {
            response in
            switch response.result {
                case .success(let data):
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
        }
    }
    
    @IBAction func onAvatarPressed(_ sender: UIButton) {
        let alertSheet = UIAlertController(title: "Sube una foto para personalizar tu cuenta de Wunderlist Clone.", message: nil, preferredStyle: .actionSheet)
        alertSheet.addAction(UIAlertAction(title: "Elegir de la galería", style: .default, handler: {
            _ in
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.allowsEditing = false
            self.present(self.imagePicker, animated: true, completion: nil)
        }))
        alertSheet.addAction(UIAlertAction(title: "Tomar una foto", style: .default, handler: {
            _ in
            self.imagePicker.sourceType = .camera
            self.imagePicker.allowsEditing = true
            self.present(self.imagePicker, animated: true, completion: nil)
        }))
        alertSheet.addAction(UIAlertAction(title: "Cerrar", style: .cancel, handler: nil ))
        self.present(alertSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            buttonAvatar.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            buttonAvatar.clipsToBounds = true
            buttonAvatar.setImage(image, for: .normal)
        }
        dismiss(animated: true, completion: nil)
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
