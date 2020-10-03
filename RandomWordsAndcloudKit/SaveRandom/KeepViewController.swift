//
//  KeepViewController.swift
//  SaveRandom
//
//  Created by 장은비 on 2020/09/26.
//

import UIKit

class KeepViewController: UIViewController {
    
    @IBOutlet var showWords: UILabel!
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    //프로퍼티 생성
    var paramWords : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        //받은 값 화면에 보여주기
        //self.showWords.text = paramWords
        
        let ud = UserDefaults.standard
        
        showWords.text = "\(ud.string(forKey: "keywordFirst")!), \(ud.string(forKey: "keywordSec")!), \(ud.string(forKey: "keywordThird")!)"
        
      //  showWords.text = "\(keySet)"
        
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
