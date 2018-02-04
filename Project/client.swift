//
//  Client.swift
//  Project
//
//  Created by student on 2018/2/4.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit
import Firebase

class Client: UIViewController {
    
    @IBAction func logout(_ sender: Any) {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                let userDefaults = UserDefaults.standard
                userDefaults.set(false, forKey: "isLogined")
                userDefaults.synchronize()
                backLobby()
                let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "loginVC")
                present(loginVC!, animated: true, completion: nil)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
    func backLobby() {
        self.tabBarController?.selectedIndex = 0
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

