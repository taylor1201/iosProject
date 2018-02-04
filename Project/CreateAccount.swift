//
//  CreatAccount.swift
//  Project
//
//  Created by student on 2018/2/3.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit
import Firebase

class CreateAccount: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorMassage: UILabel!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        email.resignFirstResponder()
        password.resignFirstResponder()
        return true
    }
    
    @IBAction func createAction(_ sender: Any){
        if email.text == ""{
            let alertConrtroller = UIAlertController(title: "Error", message: "Please enter your email.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertConrtroller.addAction(defaultAction)
            self.present(alertConrtroller, animated: true,completion:  nil)
        }
        if password.text == ""{
            let alertConrtroller = UIAlertController(title: "Error", message: "Please enter your password.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertConrtroller.addAction(defaultAction)
            self.present(alertConrtroller, animated: true,completion:  nil)
        } else {
            let passOK = "密碼格式正確"
            let r = passwordCheck(password: password.text!)
            if r == passOK {
                Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (uesr, error) in
                    if error == nil {
                        let alertController = UIAlertController(title: "Success", message: "You have successfully create an account.", preferredStyle: .alert)
                        let userDefaults = UserDefaults.standard
                        userDefaults.set(true, forKey: "isLogined")
                        userDefaults.synchronize()
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: { (UIAlertAction) in
                            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "Detail") as? Detail {
                                vc.emailCA = self.email.text
                                vc.title = "Personal information"
                                self.present(vc, animated: true, completion: nil)
                            }
                        })
                        alertController.addAction(defaultAction)
                        self.present(alertController, animated: true, completion:  nil)
                    }else {
                        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        self.present(alertController, animated: true, completion:  nil)
                    }
                }
            } else {
                errorMassage.text = "\(r)"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "New Account"
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    func passwordCheck(password:String) -> String {
        var r = "密碼格式不正確"
        
        var isLongEnough:Bool = false
        var hasUppercase = false
        var hasLowercase = false
        var hasNumber = false
        
        if password.count >= 8 {
            isLongEnough = true
        }
        for char:Character in password{
            let str:String = "\(char)"
            if str.lowercased() != str {
                hasUppercase = true
            }
            if str.uppercased() != str {
                hasLowercase = true
            }
            if Int(str) != nil{
                hasNumber = true
            }
        }
        
        if isLongEnough && hasNumber && hasLowercase && hasLowercase {
            r = "密碼格式正確"
        }
        else{
            if isLongEnough == false {
                r.append(", 長度要超過8個字")
            }
            if hasUppercase == false {
                r.append(", 需要大寫字母")
            }
            if hasLowercase == false {
                r.append(", 需要小寫字母")
            }
            if hasNumber == false {
                r.append(", 需要包含數字")
            }
        }
        return r
    }
}

