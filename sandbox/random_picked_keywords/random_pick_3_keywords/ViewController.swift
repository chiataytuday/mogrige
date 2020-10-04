//
//  ViewController.swift
//  random_pick_3_keywords
//
//  Created by Hyunseok Yang on 2020/09/19.
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var keyword01: UILabel!
    @IBOutlet weak var keyword02: UILabel!
    @IBOutlet weak var keyword03: UILabel!
    
    let keywordList = ["고양이", "강아지", "잠자리", "바람", "노을", "의자", "바다", "허수아비", "청소", "노트북", "책상", "손수건", "밀짚모자", "김밥", "옥수수", "코트", "패딩", "새싹", "봄비", "반딧불이", "토끼", "가을", "단풍", "산책", "손전등", "별", "하늘", "구름", "태풍", "손목시계", "책"]
    
    func randomPicked() {
        var resultSet = Set<String>()

        while resultSet.count < 3 {
            let randomIndext = Int(arc4random_uniform(UInt32(keywordList.count)))
            resultSet.insert(keywordList[randomIndext])
        }
        let resultArray = Array(resultSet)
        
        keyword01.text = resultArray[0]
        keyword02.text = resultArray[1]
        keyword03.text = resultArray[2]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //111111111
    }
    
    override func viewDidAppear(_ animated: Bool) {
        randomPicked()
    }
    
    @IBAction func rePick(_ sender: Any) {
        randomPicked()
    }
   
}

