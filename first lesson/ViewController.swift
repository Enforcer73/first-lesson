//
//  ViewController.swift
//  first lesson
//
//  Created by Ruslan Bagautdinov on 21.10.2021.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {

    @IBOutlet private weak var increaseButton: UIButton!
    @IBOutlet private weak var decreaseButton: UIButton!
    @IBOutlet private weak var resultLabel: UILabel!
    
    private var counter: Int = 0 {
        didSet {
            increaseButton.isEnabled = counter < 10
            decreaseButton.isEnabled = counter > -10
            resultLabel.text = "\(counter)"
        }
    }
    
    @IBAction private func increaseButton(_ sender: UIButton) {
        counter += 1
    }
    
    @IBAction private func decreaseButton(_ sender: UIButton) {
        counter -= 1
    }
    
    @IBAction private func reset(_ sender: UIButton) {
        counter = 0
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
}

