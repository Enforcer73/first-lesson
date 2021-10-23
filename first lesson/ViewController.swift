//
//  ViewController.swift
//  first lesson
//
//  Created by Ruslan Bagautdinov on 21.10.2021.
//

import UIKit


final class ViewController: UIViewController {

    @IBOutlet private weak var increaseButton: UIButton!
    @IBOutlet private weak var decreaseButton: UIButton!
    @IBOutlet private weak var resultLabel: UILabel!
    
    private var counter: Int = 0 {
        didSet {
            increaseButton.isEnabled = counter < 10
            decreaseButton.isEnabled = counter > -10
            resultLabel.text = "\(counter)"
            
            //Limit alert
            if counter == 10 || counter == -10 {
                let alert = UIAlertController(title: "Внимание!", message: "Вы достигли максимального значения!", preferredStyle: .alert)
                let OkButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(OkButton)
                present(alert, animated: true, completion: nil)
                
                //Haptic feedback Warning
                let generatorWarning = UINotificationFeedbackGenerator()
                    generatorWarning.prepare()
                    generatorWarning.notificationOccurred(.warning)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction private func pressedButton(_ sender: UIButton) {
        switch sender.tag {
        case 1: //+
            counter += 1
        case 2: //-
            counter -= 1
        case 3: //clear
            counter = 0
        default:
            break
        }
        
        //Haptic feedback
        let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.prepare()
            generator.impactOccurred()
    }
}

