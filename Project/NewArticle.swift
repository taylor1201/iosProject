//
//  NewArticle.swift
//  Project
//
//  Created by student on 2018/2/4.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit

class NewArticle: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var addTitle: UITextField!
    @IBOutlet weak var addSubtitle: UITextField!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addTitle.resignFirstResponder()
        addSubtitle.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "新增問卷"
        
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
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
