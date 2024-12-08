//
//  ViewController.swift
//  Warikan
//
//  Created by Mishima Haruto on 12/8/24.
//


import UIKit

class ViewController: UIViewController,  UITextFieldDelegate {
    
    @IBOutlet var moneyTextField : UITextField!
    @IBOutlet var tipTextField : UITextField!
    @IBOutlet var  resultLabel : UILabel!
    @IBOutlet var globe : UIButton!
    @IBOutlet var Next : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        moneyTextField.delegate = self
        tipTextField.delegate = self
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
           calculateResult()
           return true
       }
    
    func calculateResult() {
        // 金額とTip率を取得
        guard let amountText = moneyTextField.text,
              let tipText = tipTextField.text,
              let amount = Double(amountText),
              let tipPercentage = Double(tipText) else {
            resultLabel.text = "入力が正しくありません"
            return
        }

        // Tip計算
        let tip = amount * (tipPercentage / 100)
        print("amount")
        print(amount)
        print("tippercentage")
        print(tipPercentage)
        print("tip")
        print(tip)
        let total = amount + tip
print("total")
        print(total)
        // 結果をラベルに表示
        resultLabel.text = String(format: "¥ %.2f", total)
    }
    
    
}

