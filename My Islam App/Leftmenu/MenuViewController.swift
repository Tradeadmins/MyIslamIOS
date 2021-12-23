//
//  MenuViewController.swift
//  AKSwiftSlideMenu
//
//  Created by Ashish on 21/09/15.
//  Copyright (c) 2015 Kode. All rights reserved.
//

import UIKit

struct SectionData {
    let title: String
    let data : [String]
    var numberOfItems: Int {
        return data.count
    }
    subscript(index: Int) -> String {
        return data[index]
    }
}

extension SectionData {
    init(title: String, data: String...) {
        self.title = title
        self.data  = data
    }
}

protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(_ index : Int32)
}

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let headerIdentifier = "headerCell"
    private let cellIdentifier = "contentCell"
    /**
    *  Array to display menu options
    */
    @IBOutlet var tblMenuOptions : UITableView!
    
    @IBOutlet weak var imageViewProfile: UIImageView!
    /**
    *  Transparent button to hide menu
    */
    @IBOutlet var btnCloseMenuOverlay : UIButton!
    
    /**
    *  Array containing menu options
    */

    lazy var mySections: [SectionData] = {
        let section1 = SectionData(title: "Faith", data: "Faith", "Prayer", "Tcharity","Fasting","Pilgrimage","Community","Settings")
        let section2 = SectionData(title: "Prayer", data: "Faith", "Prayer", "Tcharity","Fasting","Pilgrimage","Community","Settings")
        let section3 = SectionData(title: "Charity", data: "Faith", "Prayer", "Tcharity","Fasting","Pilgrimage","Community","Settings")
        let section4 = SectionData(title: "Fasting", data: "Faith", "Prayer", "Tcharity","Fasting","Pilgrimage","Community","Settings")
        return [section1, section2,section3,section4]
    }()
    
    private var seletedIndex = -1

    // var arrayMenuOptions = [Dictionary<String,String>]()
     var sectionIsExpanded = [false, false, false,false]
    /**
    *  Menu button which was tapped to display the menu
    */
    var btnMenu : UIButton!
    
    /**
    *  Delegate of the MenuVC
    */
    var delegate : SlideMenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblMenuOptions.tableFooterView = UIView()
        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapFunction(sender:)))
        imageViewProfile.isUserInteractionEnabled = true
        imageViewProfile.addGestureRecognizer(tap)
    }
    @objc
    func tapFunction(sender:UITapGestureRecognizer) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateArrayMenuOptions()
    }
    
    func updateArrayMenuOptions(){
        //arrayMenuOptions.append(["title":"Home", "icon":"HomeIcon"])
      //  arrayMenuOptions.append(["title":"Play", "icon":"PlayIcon"])
        
        tblMenuOptions.reloadData()
    }
    
    @IBAction func onCloseMenuClick(_ button:UIButton!){
        btnMenu.tag = 0
        
        if (self.delegate != nil) {
            var index = Int32(button.tag)
            if(button == self.btnCloseMenuOverlay){
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
            }, completion: { (finished) -> Void in
                self.view.removeFromSuperview()
                self.removeFromParent()
        })
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: headerIdentifier, for: indexPath) as! PseudoHeaderTableViewCell
            cell.titleLabel.text = mySections[indexPath.section].title
            if sectionIsExpanded[indexPath.section] {
                cell.setExpanded()
            }else {
                cell.setCollapsed()
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            cell.textLabel?.text = mySections[indexPath.section][indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            
        }
        if seletedIndex == indexPath.section {
            sectionIsExpanded[indexPath.section] = !sectionIsExpanded[indexPath.section]
            tableView.reloadSections([seletedIndex], with: .automatic)
            return
        }
        if seletedIndex >= 0 {
            sectionIsExpanded[seletedIndex] = false
            tableView.reloadSections([seletedIndex], with: .automatic)
        }
       
        seletedIndex = indexPath.section
        sectionIsExpanded[indexPath.section] = !sectionIsExpanded[indexPath.section]
        tableView.reloadSections([indexPath.section], with: .automatic)
        
        //}
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionIsExpanded[section] ? (mySections[section].numberOfItems) : 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return mySections.count
    }
}
class PseudoHeaderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusButton: UIButton!
    
    func setExpanded() {
        statusButton.setImage(#imageLiteral(resourceName: "clock"), for: .normal)
    }
    
    func setCollapsed() {
        statusButton.setImage(#imageLiteral(resourceName: "images"), for: .normal)
    }
}
