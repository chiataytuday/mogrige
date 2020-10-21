//
//  ViewController.swift
//  MogrigeStoryboard
//
//  Created by 장은비 on 2020/10/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var createBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let btn = createBtn {
            btn.layer.cornerRadius = 27
            btn.backgroundColor = UIColor(red: 222/255, green: 218/255, blue: 208/255, alpha: 100)
        
        }
    }


}



