//
//  ViewController.swift
//  Calculator
//
//  Created by 刘宝的电脑 on 2017/3/4.
//  Copyright © 2017年 veraliu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var core = Core<Double>()
    @IBOutlet weak var displayLable: UILabel!

    @IBAction func numberButton(_ sender: UIButton) {
        let digit = sender.tag - 1000
        let currentText = self.displayLable.text ?? "0"
        if currentText == "0" {
            self.displayLable.text = "\(digit)"
        } else {
            self.displayLable.text! += String(digit)
        }
    }
 
    @IBAction func operatorButton(_ sender: UIButton) {
        let currentText = self.displayLable.text ?? "0"
        let currentNumber = Double(currentText)!
        try! self.core.addStep(currentNumber)
        
        
        if sender.tag == 1101 {
            try! self.core.addStep(+)
        } else if sender.tag == 1102 {
            try! self.core.addStep(-)
        }
        
        self.displayLable.text = "0"
        
    }

    @IBAction func equalButton(_ sender: UIButton) {
        let currentText = self.displayLable.text ?? "0"
        let currentNumber = Double(currentText)!
        try! self.core.addStep(currentNumber)
        
        let result = self.core.calculate()!
        self.displayLable.text = "\(result)"
        
        self.core = Core<Double>()
    }

}

