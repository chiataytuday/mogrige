//
//  RandomKeywordsCard.swift
//  SwipeCards
//
//  Created by Taylor Hyobeen Moon on 2020/10/12.
//

import UIKit

class RandomkeywordsCard: UIViewController {
    @IBOutlet weak var keywordsView: UIView!
    @IBOutlet weak var keyword1: UILabel!
    @IBOutlet weak var keyword2: UILabel!
    @IBOutlet weak var keyword3: UILabel!
    @IBOutlet weak var thumbImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
        
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        
        
        
        
        if xFromCenter > 0 {
            thumbImageView.image = UIImage(named: "thumbsUp")
            thumbImageView.tintColor = UIColor.green
        } else {
            thumbImageView.image = UIImage(named: "thumbsDown")
            thumbImageView.tintColor = UIColor.red
        }
        
        thumbImageView.alpha = abs(xFromCenter) / view.center.x
        
        //card fade away when it passes certain pointof x-axis
        if sender.state == UIGestureRecognizer.State.ended {
            
            if card.center.x < 75 {
                // move off to the left side
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
                })
                card.alpha = 0
                return
            } else if card.center.x > (view.frame.width - 75) {
                // move off to the right side
                UIView.animate(withDuration: 0.3,animations: {
                    card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
                })
                card.alpha = 0
                return
            } else {
                //reset the card on the original spot
                card.center = self.view.center
                thumbImageView.alpha = 0
            }
        }
    }
    
    
    
    @IBAction func reset(_ sender: UIButton) {
        resetCard()
    }
    
    
    
    //swipe animation function + put back on the original spot
    func animate() {
        UIView.animate(withDuration: 0.2, animations: {
            self.keywordsView.center = self.view.center
        })
    }
    
    //temporary reset button
    func resetCard() {
        animate()
        self.thumbImageView.alpha = 0
        self.keywordsView.alpha = 1
    }
    
    
}
