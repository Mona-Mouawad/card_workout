//
//  CardSelectionVC.swift
//  card_workout
//
//  Created by Mona on 05/11/2024.
//

import UIKit

class CardSelectionVC: UIViewController {

    @IBOutlet  var stopButton: UIButton!
    
    @IBOutlet weak var rulesButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var cardImage: UIImageView!
    
    var timer : Timer!
    var cards : [UIImage] =  CardImage.allCardsImage 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        // Do any additional setup after loading the view.
        for button in buttons{
            button.layer.cornerRadius = 20
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self,
                                     selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    

    
    @objc  func showRandomImage(){
        cardImage.image = cards.randomElement() ?? UIImage(named: "AC")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }

    
    @IBAction func restartActionButton(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
    @IBAction func rulesActionButton(_ sender: Any) {
    }
    @IBAction func stopAction(_ sender: UIButton) {
        timer.invalidate()
    }
}
