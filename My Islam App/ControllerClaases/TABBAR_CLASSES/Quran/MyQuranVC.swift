//
//  MyQuranVC.swift
//  My Islam App
//
//  Created by Apple on 23/01/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

import CarbonKit
class MyQuranVC: UIViewController {
    
    // MARK: - property declaration
    var numberArray = ["Dail Verse","Popular","Checked","Fovorites"]
    
    // MARK: - View Controller lyfe cyle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
// MARK: - Tableview datasource & delegates
extension MyQuranVC : UITableViewDataSource,UITableViewDelegate{
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return numberArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyQuranCell") as! MyQuranCell
            cell.lbl_QuranDetails?.text =  numberArray[indexPath.row]
            cell.costomView.layer.borderWidth = 2
            cell.costomView.layer.borderColor = UIColor.gray.cgColor
            cell.costomView.layer.masksToBounds = true
            return cell
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 96
        }
      
    }



