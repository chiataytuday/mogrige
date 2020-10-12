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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        randomPicked()
    }

    @IBAction func rePick(_ sender: Any) {
        randomPicked()
    }


}

