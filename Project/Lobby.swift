//
//  Lobby.swift
//  Project
//
//  Created by student on 2018/2/3.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit

class Lobby: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var article:[(articleTitle:String, articlesubtitle:String)] = [("Hello", "HI"), ("test", "font"), ("test", "font"), ("test", "font")]
    var articlew:[(articleTitle:String, articlesubtitle:String)] = [("Hello", "HI"), ("test", "font"), ("test", "font")]
    
    @IBOutlet weak var select1: UICollectionView!
    @IBOutlet weak var select2: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == select1 {
            return article.count
        } else if collectionView == select2 {
            return articlew.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var reuseIndentifier = "lobbyArticle"
        if collectionView == select2 {
            reuseIndentifier = "test"
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIndentifier, for: indexPath)
        if collectionView == select1 {
            if let articleCell = cell as? ArticleCell {
                articleCell.title.text = article[indexPath.row].0
                articleCell.subtitle.text = article[indexPath.row].1
            }
        } else if collectionView == select2 {
                if let articleCell = cell as? ArticleCell {
                    articleCell.title.text = article[indexPath.row].0
                    articleCell.subtitle.text = article[indexPath.row].1
            }
        }
        return cell
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

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if let vc = self.storyboard?.instantiateViewController(withIdentifier: "ArticlePage") {
    self.navigationController?.pushViewController(vc, animated: true)
    }
    }
    @IBAction func AddNewArticle(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "ArticleEdit") {
            vc.title = "New Article"
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
