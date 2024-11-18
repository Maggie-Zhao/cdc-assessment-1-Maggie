//
//  CryptoTableViewCell.swift
//  cdc-assessment-1-Maggie
//
//  Created by 赵明慧 on 2024/11/16.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
