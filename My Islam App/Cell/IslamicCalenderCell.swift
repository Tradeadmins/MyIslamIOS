//
//  IslamicCalenderCell.swift
//  My Islam App
//
//  Created by Apple on 28/01/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class IslamicCalenderCell: UITableViewCell {

    @IBOutlet weak var costomView: UIView!
    @IBOutlet weak var lbl_date: UILabel!
    @IBOutlet weak var lbl_titleName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
