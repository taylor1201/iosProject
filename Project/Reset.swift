//
//  Reset.swift
//  Project
//
//  Created by student on 2018/2/4.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit
import Firebase

class Reset: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailText: UITextField!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailText.resignFirstResponder()
        return true
    }
    
    @IBAction func sendReset(_ sender: Any) {
        if self.emailText.text == "" {
            let alertConrtroller = UIAlertController(title: "Oops", message: "Please enter your email.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertConrtroller.addAction(defaultAction)
            self.present(alertConrtroller, animated: true,completion:  nil)
        }else {
            Auth.auth().sendPasswordReset(withEmail: self.emailText.text!, completion: { (error) in
                var title = ""
                var message = ""
                if error != nil {
                    title = "Error!"
                    message = (error?.localizedDescription)!
                }else {
                    title = "Success!"
                    message = "Password reset email sent."
                    self.emailText.text = ""
                }
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            })
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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

}
