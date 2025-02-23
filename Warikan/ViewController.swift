//
//  ViewController.swift
//  Warikan
//
//  Created by Mishima Haruto on 12/8/24.
//


import UIKit
//↓ changed
class ViewController: UIViewController,  UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    //↑
    
    
    @IBOutlet var moneyTextField : UITextField!
    @IBOutlet var tipTextField : UITextField!
    @IBOutlet var  resultLabel : UILabel!
    @IBOutlet var globe : UIButton!
    @IBOutlet var tonext : UIButton!
    
    //↓ changed
    let currencies = ["JPY - ¥", "USD - $", "EUR - €", "GBP - £", "AUD - A$"]
    let exchangeRates: [String: Double] = [
        "JPY": 1.0,
        "USD": 0.0063,
        "EUR": 0.006,
        "GBP": 0.005,
        "AUD": 0.0102
    ]
    
    var selectedCurrency = "JPY - ¥" // 初期値
    var pickerView = UIPickerView()
    //↑
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        moneyTextField.delegate = self
        tipTextField.delegate = self
        
        //↓ changed
        // UIPickerViewの設定
        pickerView.delegate = self
        pickerView.dataSource = self
        
        // 初期設定
        resultLabel.text = "¥ 0"
        //↑
        
        tonext.layer.cornerRadius = 10
        
        
        
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
        //print("amount")
        //print(amount)
        //print("tippercentage")
        //print(tipPercentage)
        // print("tip")
        // print(tip)
        let total = amount + tip
        //print("total")
        //print(total)
        // 結果をラベルに表示
        resultLabel.text = String(format: "¥ %.2f", total)
    }
    //↓ changed
    @IBAction func globeTapped(_ sender: UIButton){
        
        // UIPickerViewを表示
        let alert = UIAlertController(title: "Select Currency", message: "\n\n\n\n\n\n", preferredStyle: .alert)
        alert.isModalInPresentation = true
        
        pickerView.frame = CGRect(x: 0, y: 50, width: 250, height: 150)
        alert.view.addSubview(pickerView)
        
        // キャンセルボタン
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        // 確定ボタン
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.updateCurrency()
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func updateCurrency() {
        // 通貨の更新
        if let selected = selectedCurrency.split(separator: " ").first {
            let symbol = selectedCurrency.split(separator: "-").last?.trimmingCharacters(in: .whitespaces) ?? "¥"
            let rate = exchangeRates[String(selected)] ?? 1.0
            let amount = Double(moneyTextField.text ?? "0") ?? 0
            print("amount")
            print(amount * rate)
            let convertedAmount = amount * rate
            
            
            resultLabel.text = "\(symbol) \(convertedAmount)"
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencies[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCurrency = currencies[row]
    }
    //↑
    @IBAction func next(){
        
        performSegue(withIdentifier: "toKeisha", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toKeisha" {
            let nextVC = segue.destination as! keishaViewController
            nextVC.amount = Int(moneyTextField.text ?? "0") ?? 0
        }
    }
}

