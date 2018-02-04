//
//  Detail.swift
//  Project
//
//  Created by student on 2018/2/4.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit

class Detail: UIViewController {
    
    var emailCA:String?
    
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var password: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        email.text = "Email: \(emailCA!)"

        // Do any additional setup after loading the view.
    }

    @IBAction func disappear(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
//    override func viewDidAppear(_ animated: Bool) {
//        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "createVE") {
//            vc.title = "New Article"C.text = email
//        }
//    }
    
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
