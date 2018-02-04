//
//  Login.swift
//  Project
//
//  Created by student on 2018/2/3.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit
import Firebase

class Login: UIViewController {
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func LoginAction(_ sender: Any) {
        if self.email.text == "" || self.password.text == "" {
        let alertConrtroller = UIAlertController(title: "Error", message: "Please enter your email and password.", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertConrtroller.addAction(defaultAction)
        self.present(alertConrtroller, animated: true,completion:  nil)
        }else {
            Auth.auth().signIn(withEmail: self.email.text!, password: self.password.text!) { (user, error) in
            if error == nil {
                let userDefaults = UserDefaults.standard
                userDefaults.set(true, forKey: "isLogined")
                userDefaults.synchronize()
                self.dismiss(animated: true, completion: nil)
            }else {
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion:  nil)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardDidShow, object: nil, queue: nil) {_ in
        }
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardDidHide, object: nil, queue: nil) {_ in
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        @IBAction func cancel(segue: UIStoryboardSegue) {}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
