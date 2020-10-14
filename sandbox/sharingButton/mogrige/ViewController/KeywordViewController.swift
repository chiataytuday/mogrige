//
//  KeywordViewController.swift
//  mogrige
//
//  Created by Taylor Hyobeen Moon on 2020/09/20.
//

import UIKit

class KeywordViewController: UIViewController {
    
    
    let keywordList = ["고양이", "강아지", "잠자리", "바람", "노을", "의자", "바다", "허수아비", "청소", "노트북", "책상", "손수건", "밀짚모자", "김밥", "옥수수", "코트", "패딩", "새싹", "봄비", "반딧불이", "토끼", "가을", "단풍", "산책", "손전등", "별", "하늘", "구름", "태풍", "손목시계", "책"]
    
    func randomKeywordCombination(list: [String]){
        var randomPickedKeywords = Set<String>()
    
        while randomPickedKeywords.count < 3 {
            let randomInt = Int.random(in: 0...list.count-1)
            
            randomPickedKeywords.insert(list[randomInt])
        }
        var randomPickedKeywordsArray = Array(randomPickedKeywords)
        
        keywordLabel1.text = randomPickedKeywordsArray[0]
        keywordLabel2.text = randomPickedKeywordsArray[1]
        keywordLabel3.text = randomPickedKeywordsArray[2]
        
        randomPickedKeywordsArray.removeAll()
    }
    
    @IBOutlet weak var keywordLabel1: UILabel!
    @IBOutlet weak var keywordLabel2: UILabel!
    @IBOutlet weak var keywordLabel3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        randomKeywordCombination(list: keywordList)
    }
    
    
    // when repick is pressed
    @IBAction func rePickButton(_ sender: Any) {
        randomKeywordCombination(list: keywordList)
    }
    
    
     @IBAction func save(_ sender: Any) {
     
     
     //let newKeywordSet = KeywordSet(quarter: "2020-03", keywords: newKeywords, artTitle: nil, artImg: nil, artMemo: nil)
     
     //Keyword.dummyKeywords.append(newKeywordSet)
     
     dismiss(animated: true, completion: nil)
     }
     
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
 }
