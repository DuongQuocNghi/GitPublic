//
//  SupplieViewCellTableViewCell.swift
//  IOSD005-060519
//
//  Created by ADMIN on 5/6/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class SupplieViewCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var noLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
