//
//  ViewController.swift
//  Calculator
//
//  Created by Erick Alcantara on 12/19/18.
//  Copyright © 2018 Erick Alcantara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func clear(_ sender: Any) {
        label.text = "0"
        
    }
    
    @IBAction func numbersPressed(_ sender: UIButton) {
        if let titleLabel: UILabel = sender.titleLabel {
            if let number: String = titleLabel.text {
                if label.text == "0" {
                    label.text = ""
                }
                label.text! += number
            }
        }
    }
    
    @IBAction func decimalPressed(_ sender: UIButton) {
        if label.text == "0" {
            label.text = ""
        }
        label.text! += "."
    }
    
    @IBAction func operatorPressed(_ sender: UIButton) {
        if let titleLabel: UILabel = sender.titleLabel {
            if let myOperator: String = titleLabel.text {
                label.text! += myOperator
            }
        }
    }
    
    @IBAction func equalPressed(_ sender: UIButton) {
        var s: String = label.text!;
        s = s.replacingOccurrences(of: "−", with: "-")
        s = s.replacingOccurrences(of: "×", with: "*")
        s = s.replacingOccurrences(of: "÷", with: ".0/")
        let expression: NSExpression = NSExpression(format: s);
        if let result: NSNumber = expression.expressionValue(with: nil, context: nil) as? NSNumber {
            label.text = result.stringValue;
        }
    }
    
} //class

