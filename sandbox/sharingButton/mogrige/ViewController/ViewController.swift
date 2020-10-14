//
//  ViewController.swift
//  mogrige
//
//  Created by Taylor Hyobeen Moon on 2020/09/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var artTitle: UILabel!
    @IBOutlet weak var createdDate: UILabel!
    @IBOutlet weak var keywordLabel1: UILabel!
    @IBOutlet weak var keywordLabel2: UILabel!
    @IBOutlet weak var keywordLabel3: UILabel!
    @IBOutlet weak var artImg: UIImageView!
    @IBOutlet weak var artMemo: UITextView!
    
    var selectedTitle: String?
    
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        f.locale = Locale(identifier: "Ko_kr")
        return f
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    let myWork = KeywordSet.dummyKeywords[0]
    
   
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        artTitle.text = myWork.artTitle
        keywordLabel1.text = "#" + myWork.keywords[0]
        keywordLabel2.text = "#" + myWork.keywords[1]
        keywordLabel3.text = "#" + myWork.keywords[2]

        if myWork.artImg != nil {
            artImg.image = UIImage(named: myWork.artImg!)
        }
        
        artMemo.text = myWork.artMemo
    }
    
    //공유 기능 샘플 코드
    @IBAction func shareButtonPressed(_ sender: Any) {
        let items = [artImg.image!]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
    }
    
    
}

