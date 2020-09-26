//
//  ResultViewController.swift
//  ReviewMyself
//
//  Created by 장은비 on 2020/09/26.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultShow: UILabel!
    
    
    //값 받을 프로퍼티 생성 - 타입 어노테이션과 초기화 동시 진행 - 이전화면의 뷰컨트롤러에서 타입이 일치해야함
    var paramResult : String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.resultShow.text = paramResult
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
