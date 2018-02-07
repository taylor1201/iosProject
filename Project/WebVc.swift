//
//  WebVc.swift
//  Project
//
//  Created by student on 2018/2/7.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit
import WebKit

class WebVc: UIViewController {

    
    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://192.168.1.47:3000")
        let request = URLRequest(url: url!)
        
        webview.load(request)

        // Do any additional setup after loading the view.
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
