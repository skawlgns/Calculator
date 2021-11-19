//
//  ViewController.swift
//  Calculator
//
//  Created by 남지훈 on 2021/11/19.
//

import UIKit

enum Operation {
    case Sum
    case Sub
    case Mul
    case Div
    case Nothing
}


class ViewController: UIViewController {
   
    @IBOutlet weak var displayLabel: UILabel!
    
    var denoteNum = "" // 버튼을 누를 때 마다 표시
    var firstNum = "" // 첫번째 피연산자
    var secondNum = "" // 두번째 피연산자
    var result = "" // 계산 결과값
    var currentOperation: Operation = .Nothing // 현재 연산자
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapNumberBtn(_ sender: UIButton) {
        guard let numValue = sender.title(for: .normal) else { return }
        if self.denoteNum.count < 12 {
            self.denoteNum += numValue
            self.displayLabel.text = self.denoteNum
        }
    }
    @IBAction func tapACBtn(_ sender: UIButton) {
        self.denoteNum = ""
        self.firstNum = ""
        self.secondNum = ""
        self.result = ""
        self.currentOperation = .Nothing
        self.displayLabel.text = "0"
    }
    
    
    @IBAction func tapDotBtn(_ sender: UIButton) {
        if self.denoteNum.count < 11 , !self.denoteNum.contains("."){
            self.denoteNum += self.denoteNum.isEmpty ? "0." : "."
            self.displayLabel.text = self.denoteNum
        }
    }
    @IBAction func tapDivBtn(_ sender: UIButton) {
        self.operation(.Div)
    }
    @IBAction func tapMulBtn(_ sender: UIButton) {
        self.operation(.Mul)
    }
    @IBAction func tapSubBtn(_ sender: UIButton) {
        self.operation(.Sub)
    }
    @IBAction func tapSumBtn(_ sender: UIButton) {
        self.operation(.Sum)
    }
    @IBAction func tapEqulBtn(_ sender: UIButton) {
        self.operation(self.currentOperation)
    }
    
    func operation(_ operationParams: Operation) {
        if self.currentOperation != .Nothing{ // = 버튼을 눌렀을 때
            if !self.denoteNum.isEmpty{ // 두번째 숫자를 눌렀을 때
                self.secondNum = self.denoteNum
                self.denoteNum = ""
                
                guard let firstNum = Double(self.firstNum) else { return } //연산을 위해 Double형으로
                guard let secondNum = Double(self.secondNum) else { return }
                
                switch self.currentOperation {
                case .Sum:
                    self.result = "\(firstNum + secondNum)"
                case .Sub:
                    self.result = "\(firstNum - secondNum)"
                case .Mul:
                    self.result = "\(firstNum * secondNum)"
                case .Div:
                    self.result = "\(firstNum / secondNum)"
                default:
                    break
                }
                if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.result = "\(Int(result))"
                }
                
                self.firstNum = self.result // 연산을 이어나갈 수 있도록
                self.displayLabel.text = self.result
            }
            self.currentOperation = operationParams
        } else { // 처음 연산자 버튼을 눌렀을 때
            self.firstNum = self.denoteNum
            self.currentOperation = operationParams
            self.denoteNum = ""
        }
    }
    
}

