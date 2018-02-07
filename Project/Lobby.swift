//
//  Lobby.swift
//  Project
//
//  Created by student on 2018/2/3.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit

class Lobby: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var article:[(articleTitle:String, articlesubtitle:String)] = [("App滿意調查", "本工作室為持續提供更好的服務，特製作本問卷，以瞭解您對本工作室服務品質、服務態度與業務電腦化的看法與建議，請您依實際經驗與個人認知，回答下列所有的問題，感謝您撥冗填寫，謝謝您！"), ("冷飲喜好調查", "徵求熱愛冷飲的朋友參與本次問卷調查！！"), ("未來就業期望調查", "希望了解學生對於未來就業的展望"), ("購物習慣調查", "請要了解各年齡層購物習慣")]
    var articlew:[(articleTitle:String, articlesubtitle:String)] = [("高血壓與心血管疾病調查", "為進行高血壓與心血管疾病相關論文研究,請大家多多幫忙,謝謝！"), ("平日讀書時間調查", "大家都花多少時間在讀書呢？熱烈徵求大家的回饋"), ("北車附近美食熱點調查", "純粹想知道北車有什麼好吃的店QQ")]
    
    @IBOutlet weak var select1: UICollectionView!
    @IBOutlet weak var select2: UICollectionView!
    @IBOutlet weak var select3: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == select1 {
            return article.count
        } else if collectionView == select2 {
            return articlew.count
        } else if collectionView == select3 {
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
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        
        navigationController?.navigationBar.shadowImage = UIImage()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let userDefaults = UserDefaults.standard
        let isLogined = userDefaults.value(forKey: "isLogined") as? Bool
        
        if isLogined != nil && isLogined! == true {
            
        }else {
            let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "loginVC")
            present(loginVC!, animated: true, completion: nil)
        }
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
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
