//
//  SuraDetaillCell.swift
//  My Islam App
//
//  Created by Apple on 06/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SuraDetaillCell: UITableViewCell {
    
    @IBOutlet weak var lblAyaEnglishDescription: UILabel!
    @IBOutlet weak var lblAyaIndex: UILabel!
    @IBOutlet weak var lblAyaArabicDescription: UILabel!
    @IBOutlet weak var lblSuraEnglishName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
