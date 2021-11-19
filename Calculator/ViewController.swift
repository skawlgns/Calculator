//
//  ViewController.swift
//  Calculator
//
//  Created by 남지훈 on 2021/11/19.
//

import UIKit



class ViewController: UIViewController {
   
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapNumberBtn(_ sender: UIButton) {
        if let number = sender.title(for: .normal){
            self.displayLabel.text = number
        }
    }
    @IBAction func tapACBtn(_ sender: UIButton) {
    }
    
    
    @IBAction func tapDotBtn(_ sender: UIButton) {
    }
    @IBAction func tapDivBtn(_ sender: UIButton) {
    }
    @IBAction func tapMulBtn(_ sender: UIButton) {
    }
    @IBAction func tapSubBtn(_ sender: UIButton) {
    }
    @IBAction func tapSumBtn(_ sender: UIButton) {
    }
    @IBAction func tapEqulBtn(_ sender: UIButton) {
    }
}

