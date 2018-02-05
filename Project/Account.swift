//
//  Account.swift
//  Project
//
//  Created by student on 2018/2/5.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit
import Firebase

class Account: UIViewController {
    
    let profile:[[String]] = [["Male", "<18", "學生"], ["Female", "31~35", "其他"], ["Female", "36~40", "客服支援"], ["No comment", "18~25", "其他"]]
    
    lazy var ref = Database.database().reference()
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var education: UILabel!
    
    var i:Int = Int(arc4random_uniform(4))
    
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
        let email:String = (Auth.auth().currentUser?.email)!
        emailLabel.text = email
        gender.text = "性別 \(profile[i][0])"
        age.text = "年齡 \(profile[i][1])"
        education.text = "職業 \(profile[i][2])"
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        
        navigationController?.navigationBar.shadowImage = UIImage()
    }
        // Do any additional setup after loading the view.
    
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
