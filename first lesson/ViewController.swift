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
            if counter == 10 {
                let alertMax = UIAlertController(title: "Внимание!", message: "Вы достигли максимального значения!", preferredStyle: .alert)
                let OkButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alertMax.addAction(OkButton)
                present(alertMax, animated: true, completion: nil)
                let generatorWarning = UINotificationFeedbackGenerator()
                    generatorWarning.notificationOccurred(.warning)
                }
                        
            if counter == -10 {
                let alertMin = UIAlertController(title: "Внимание!", message: "Вы достигли минимального значения!", preferredStyle: .alert)
                let OkButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alertMin.addAction(OkButton)
                present(alertMin, animated: true, completion: nil)
                let generatorWarning = UINotificationFeedbackGenerator()
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
    
    //Status bar style
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

