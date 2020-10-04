//
//  ViewController.swift
//  SaveRandom
//
//  Created by 장은비 on 2020/09/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var keywordFirst: UILabel!
    @IBOutlet var keywordSec: UILabel!
    @IBOutlet var keywordThird: UILabel!
    
    let wordArray = ["고양이", "노을", "의자", "분홍구름", "유리꽃병", "둥근테이블", "체크식탁보"]
    
    //랜덤 워드 뽑는 메소드
    func randomPick() {
        var resultSet = Set<String>()
        
        while resultSet.count < 3 {
            let randomIndex = Int(arc4random_uniform(UInt32(wordArray.count)))
            resultSet.insert(wordArray[randomIndex])
        }
        
        let resultArray = Array(resultSet)
        
        self.keywordFirst.text = resultArray[0]
        self.keywordSec.text = resultArray[1]
        self.keywordThird.text = resultArray[2]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        randomPick()
    }
    
    @IBAction func reSet(_ sender: Any) {
        randomPick()
    }
    
    //세그웨이로 연결하는 구문
    @IBAction func keepThem(_ sender: Any) {
        //UserDefaults 객체의 인스턴스를 가져옴
        let ud = UserDefaults.standard
        
        //값을 저장한다.
        ud.set(self.keywordFirst.text, forKey: "keywordFirst")
        ud.set(self.keywordSec.text, forKey: "keywordSec")
        ud.set(self.keywordThird.text, forKey: "keywordThird")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //목적지 인스턴스
        let dest = segue.destination
        
        //타입 캐스팅
        guard let kvc = dest as? KeepViewController else {
            return
        }
        
        //값 전달
        kvc.paramWords = "\(self.keywordFirst.text!), \(self.keywordSec.text!), \(self.keywordThird.text!)"
    }
    


}

