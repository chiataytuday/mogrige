//
//  ViewController.swift
//  mogrige
//
//  Created by Hyunseok Yang on 2020/09/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var keyword01: UILabel!
    @IBOutlet weak var keyword02: UILabel!
    @IBOutlet weak var keyword03: UILabel!
    
    @IBAction func closeModal(
        _ segue: UIStoryboardSegue) {
        
    }
    
    // 랜덤키워드 만들기
    func randomPicked() {
        var resultSet = Set<String>()

        while resultSet.count < 3 {
            let randomIndext = Int.random(in: 0...keywordList.count-1)
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        randomPicked()
    }

    // 리픽 버튼 눌렀을때 랜덤픽하기
    @IBAction func rePick(_ sender: Any) {
        randomPicked()
    }
    
    
    // 모달에 데이터 전달하기
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let pickedKeword = [keyword01.text, keyword02.text, keyword03.text]

        guard let vc = segue.destination as? ModalViewController else { return }
        
        let selectedTitle:String! = "#\(pickedKeword[0]!),  #\(pickedKeword[1]!),  #\(pickedKeword[2]!)"

        vc.selectedTitle = selectedTitle
        
    }


}

