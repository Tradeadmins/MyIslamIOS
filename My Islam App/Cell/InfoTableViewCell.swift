//
//  InfoTableViewCell.swift
//  FMDBDatabase Demo
//
//  Created by Parth Changela on 22/06/17.
//  Copyright © 2017 Micropple. All rights reserved.
//

import UIKit


class InfoTableViewCell: UITableViewCell {

    @IBOutlet weak var quran_sno: UILabel!
    @IBOutlet weak var lblName: UILabel!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
