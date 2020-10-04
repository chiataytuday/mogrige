//
//  ViewController.swift
//  ReviewMyself
//
//  Created by 장은비 on 2020/09/26.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var fistWord: UILabel!
    @IBOutlet var secondWord: UILabel!
    @IBOutlet var thirdWord: UILabel!
    
    
    let keywordList = ["고양이", "노을", "의자", "분홍구름", "유리꽃병", "둥근테이블", "체크식탁보"]
    
    func randomPick() {
        var resultSet = Set<String>()
        
        while resultSet.count < 3 {
            let randomIndex = Int(arc4random_uniform(UInt32(keywordList.count)))
            resultSet.insert(keywordList[randomIndex])
        }
        
        let resultArray = Array(resultSet)
        
        fistWord.text = resultArray[0]
        secondWord.text = resultArray[1]
        thirdWord.text = resultArray[2]
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        randomPick()
    }
    
    
    @IBAction func rePick(_ sender: Any) {
        randomPick()
    }
    
    //세그웨이로 버튼 설정하고 값 전달하기
    @IBAction func onKeep(_ sender: Any) {
        self.performSegue(withIdentifier: "toTheResult", sender: self)
    }
    
    //세그웨이 전달시 외워둬야하는 메소드 prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //목적지 인스턴스 불러오기
        let dest = segue.destination
        //목적지의 클래스가 하위클래스이므로 다운캐스팅 as? 구문 사용 - 사실 아직도 guard구문 의미 잘 모름
        guard let rvc = dest as? ResultViewController else {
            return
        }
        
        //값전달
        rvc.paramResult = "\(self.fistWord.text!), \(self.secondWord.text!), \(self.thirdWord.text!)"
    }
    
    


}

