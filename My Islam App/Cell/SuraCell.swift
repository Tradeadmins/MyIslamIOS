//
//  SuraCell.swift
//  My Islam App
//
//  Created by Apple on 23/01/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SuraCell: UITableViewCell {
    
    @IBOutlet weak var lblSuraArabicText: UILabel!
    @IBOutlet weak var lblHeading: UILabel!
    @IBOutlet weak var lblSuraEnglishName: UILabel!
    @IBOutlet weak var costomView: UIView!
    @IBOutlet weak var lblAyaCount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
