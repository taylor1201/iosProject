//
//  myArticle.swift
//  Project
//
//  Created by student on 2018/2/3.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit

class MyArticle: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBAction func goback(segue: UIStoryboardSegue) {}
    
    
    var article:[(articleTitle:String, articlesubtitle:String)] = [("App滿意調查", "2017/02/03")]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return article.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myArticle", for: indexPath)
        if let articleCell = cell as? ArticleCell {
            articleCell.mytitle.text = article[indexPath.row].0
            articleCell.mysubtitle.text = article[indexPath.row].1
        }
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        
        navigationController?.navigationBar.shadowImage = UIImage()
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "ArticlePage") {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    @IBAction func AddNewArticle(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "NewArticle") {
            vc.title = "新增問卷"
            vc.title.text
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
