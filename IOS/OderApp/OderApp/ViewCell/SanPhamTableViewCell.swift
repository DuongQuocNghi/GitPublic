//
//  SanPhamTableViewCell.swift
//  OderApp
//
//  Created by ADMIN on 5/29/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class SanPhamTableViewCell: UITableViewCell {

    @IBOutlet weak var Hinh: UIImageView!
    @IBOutlet weak var Ten: UILabel!
    @IBOutlet weak var Mota: UILabel!
    @IBOutlet weak var Gia: UILabel!
    @IBOutlet weak var DatTruoc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
