//
//  itemTableViewCell.swift
//  Warikan
//
//  Created by Mishima Haruto on 1/12/25.
//

import UIKit

protocol CustomCellDelegate: AnyObject {
    func didUpdateMemo(_ cell: itemTableViewCell, name: String?, flag: Int?, optAmount: Int?)
    func didTapOptButton(_ cell: itemTableViewCell)
}

class itemTableViewCell: UITableViewCell, UITextFieldDelegate {

    weak var delegate: CustomCellDelegate?
    
    var memo: Memo!
    var flag: Int = 0
    var optAmount: Int = 0
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet var zero: UIButton!
    @IBOutlet var one: UIButton!
    @IBOutlet var two: UIButton!
    @IBOutlet var three: UIButton!
    @IBOutlet var opt: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        nameTextField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        zero.layer.cornerRadius = 20
        one.layer.cornerRadius = 20
        two.layer.cornerRadius = 20
        three.layer.cornerRadius = 20
        opt.layer.cornerRadius = 20
        
        // Configure the view for the selected state
    }
    
    
    func configure(memo: Memo){
        self.memo = memo
        self.flag = memo.flag
        self.optAmount = memo.optionAmount
        nameTextField.text = memo.name
        setCell(flag: memo.flag)
    }
    func setCell(flag: Int){
        let buttons = [zero, one, two, three, opt]
        for i in 0 ..< buttons.count{
            if i == flag {
                buttons[i]?.backgroundColor = UIColor.systemBlue
                buttons[i]?.setTitleColor(.white, for: .normal)
            }else{
                buttons[i]?.backgroundColor = UIColor.white
                buttons[i]?.setTitleColor(.blue, for: .normal)
            }
        }
    }
    
    @IBAction func zeroTapped(){
        flag = 0
        setCell(flag: flag)
        notifyUpdate()
    }
    @IBAction func oneTapped(){
        flag = 1
        setCell(flag: flag)
        notifyUpdate()
    }
    @IBAction func twoTapped(){
        flag = 2
        setCell(flag: flag)
        notifyUpdate()
    }
    @IBAction func threeTapped(){
        flag = 3
        setCell(flag: flag)
        notifyUpdate()
    }
    @IBAction func optTapped(){
        flag = 4
        setCell(flag: flag)
        notifyUpdate()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField){
       notifyUpdate()
    }
    
    private func notifyUpdate(){
        delegate?.didUpdateMemo(self,
                                name:nameTextField.text,
                                flag: flag,
                                optAmount: optAmount)
    }
}
