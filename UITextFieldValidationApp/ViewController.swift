//
//  ViewController.swift
//  UITextFieldValidationApp
//
//  Created by Qaim Raza on 26/06/2020.
//  Copyright © 2020 Qaim Raza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var QRImageVIew: UIImageView!
    var email:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
//  (txtEmail.text?.count != 0)
    @IBAction func SubmitBtn(_ sender: UIButton) {
        if (txtEmail.text?.isValidEmail)!{
            print("Valid Email!")
//            email = txtEmail.text
//            print(email!)
        }else{
            
            let alert = UIAlertController(title: "Error!", message: "Invalid Email!", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
                print("ok!")
            }
            

            alert.addAction(alertAction)
            
            present(alert, animated: true, completion: nil)
            
        }
        
//        guard let email = txtEmail.text?.count != 0 else {
//            print("Enter Email!")
//            return
//  }
        
       
        
        if (txtPassword.text?.isValidPassword)!{
            
            print("Valid Password!")
        }else{
        
            let alert = UIAlertController(title: "Error!", message: "Invalid Password!", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
                print("ok!")
                }
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
            
        }
        
        
        if (txtPhone.text?.isValidNumber)!{
            print("Valid Phone Number!")
            
            let alert = UIAlertController(title: "Successful!", message: "Want to generate QR Code?", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
                
                let email = self.txtEmail.text!
                let pass = self.txtPassword.text!
                let phone = self.txtPhone.text!
                
                
            let string3 = "\(email)\n\(Date())"
            
                
                    print(string3)
                
                    let data = string3.data(using: .ascii)
                    let filter = CIFilter(name: "CIQRCodeGenerator")
                    filter?.setValue(data, forKey: "inputMessage")
                    
                    let qrImg = UIImage(ciImage: (filter?.outputImage)!)
                    
                    self.QRImageVIew.image = qrImg
                    
                

            
            }
            
            let alertAction2 = UIAlertAction(title: "Cancel", style: .default) { (action) in
                print("cancel!")
            }
            alert.addAction(alertAction)
            alert.addAction(alertAction2)
            present(alert, animated: true, completion: nil)


        }else{
            let alert = UIAlertController(title: "Error!", message: "Invalid Phone Number!", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
                print("ok!")
                }
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
        }
        
        
        
    }
    
}

extension String{
    
    var isValidEmail: Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    var isValidPassword: Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[!@#$%^&*])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: self)
    }
    
    var isValidNumber: Bool{
        let numberTest = NSPredicate(format: "SELF MATCHES %@", "[0-9]{11}")
        return numberTest.evaluate(with: self)
    }

}
