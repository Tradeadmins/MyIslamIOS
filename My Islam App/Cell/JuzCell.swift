//
//  JuzCell.swift
//  My Islam App
//
//  Created by Apple on 23/01/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class JuzCell: UITableViewCell {

    @IBOutlet weak var lbl_count: UILabel!
    @IBOutlet weak var costomView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
