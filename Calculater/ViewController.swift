//
//  ViewController.swift
//  Calculater
//
//  Created by 백시훈 on 2022/08/17.
//

import UIKit

enum Operation{
    case Add
    case Subtract
    case Divide
    case Multiply
    case unknown
}
class ViewController: UIViewController {
    
    @IBOutlet weak var numberOutputLabel: UILabel!
    
    var displayNum = "" //계산기 디스플레이에 표시되는 문자
    var firstOperand = "" // 이전 계산값을 저장하는 객체
    var secomdOperand = "" //새롭게 입력 된 객체
    var result = "" //결과값
    var currentOperator: Operation = .unknown //현재 연산값
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tabNumberButton(_ sender: UIButton) {
        guard let numberValue = sender.titleLabel?.text else { return }
        if self.displayNum.count < 9 {
            self.displayNum += numberValue
            self.numberOutputLabel.text = self.displayNum
        }
    }
    
    @IBAction func tabClearButton(_ sender: UIButton) {
        self.displayNum = ""
        self.firstOperand = ""
        self.result = ""
        self.secomdOperand = ""
        self.currentOperator = .unknown
        self.numberOutputLabel.text = "0"
        
    }
    @IBAction func tabDotButton(_ sender: UIButton) {
        if self.displayNum.count < 8, !self.displayNum.contains("."){
            self.displayNum += self.displayNum.isEmpty ? "0." : "."
            self.numberOutputLabel.text = self.displayNum
        }
    }
    @IBAction func tabDividButton(_ sender: UIButton) {
        self.operation(.Divide)
    }
    @IBAction func tabMultiplyButton(_ sender: UIButton) {
        self.operation(.Multiply)
    }
    @IBAction func tabSubtracktButton(_ sender: UIButton) {
        self.operation(.Subtract)
    }
    @IBAction func tabPlusButton(_ sender: UIButton) {
        self.operation(.Add)
    }
    @IBAction func tabEqualButton(_ sender: UIButton) {
        self.operation(self.currentOperator)
    }
    
    func operation(_ operation: Operation){
        if self.currentOperator != .unknown{
            if !self.displayNum.isEmpty{
                self.secomdOperand = self.displayNum
                self.displayNum = ""
                
                guard let firstOperand = Double(self.firstOperand) else {return}
                guard let secondOperand = Double(self.secomdOperand) else {return}
                
                switch self.currentOperator{
                    case .Add:
                        self.result = "\(firstOperand + secondOperand)"
                    case .Subtract:
                        self.result = "\(firstOperand - secondOperand)"
                    case .Multiply:
                        self.result = "\(firstOperand * secondOperand)"
                    case .Divide:
                        self.result = "\(firstOperand / secondOperand)"
                    default:
                        break
                }
                
                if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0{
                    self.result = "\(Int(result))"
                }
                
                self.firstOperand = self.result
                self.numberOutputLabel.text = self.result
            }
            self.currentOperator = operation
        }else{
            self.firstOperand = self.displayNum
            self.currentOperator = operation
            self.displayNum = ""
        }
    }
}

