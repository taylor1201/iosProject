//
//  ViewController.swift
//  Project
//
//  Created by student on 2018/2/1.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var animate:UIImageView!
    @IBAction func disappear(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        
        navigationController?.navigationBar.shadowImage = UIImage()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        
        animate.animationImages = []
        for i in 0...360 {
            let j:String = String(format: "%05d", i)
            animate.animationImages?.append(UIImage(named: "Comp 2_\(j).png")!)
        }
        animate.animationDuration = 15
        animate.animationRepeatCount = 1
        animate.startAnimating()
        animate.image = UIImage(named: "Comp 2_00360.png")
    }

}

