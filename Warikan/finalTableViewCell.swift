//
//  finalTableViewCell.swift
//  Warikan
//
//  Created by Mishima Haruto on 1/12/25.
//

import UIKit

class finalTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setCell(name: String, price: Int){
        nameLabel.text = name
        priceLabel.text = "￥" + String(price)
    }
    
}
