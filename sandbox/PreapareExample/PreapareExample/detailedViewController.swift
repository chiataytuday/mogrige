//
//  detailedViewController.swift
//  PreapareExample
//
//  Created by park wonyoung on 2020/10/04.
//

import UIKit

class detailedViewController: UIViewController {

    var data : String?
    var data2 : String?
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    

    override func viewDidLoad() {
           super.viewDidLoad()

        label.text = data
        secondLabel.text = data2
        
        
           // Do any additional setup after loading the view.
       }

    
    
    
    
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}



