//
//  itemTableViewCell.swift
//  Warikan
//
//  Created by Mishima Haruto on 1/12/25.
//

import UIKit

class itemTableViewCell: UITableViewCell {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet var zero: UIButton!
    @IBOutlet var one: UIButton!
    @IBOutlet var two: UIButton!
    @IBOutlet var three: UIButton!
    @IBOutlet var opt: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
    
    //これが何してるかーーーー
    func setCell(name: String, zero: Bool, one: Bool, two: Bool, three: Bool, opt: Bool){
        nameTextField.text = name
        
        if zero {
            
        } else {
            
        }
        }
    
}
