//
//  JuzVC.swift
//  My Islam App
//
//  Created by Apple on 23/01/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class JuzVC: UIViewController {
    
    // MARK: - property declaration
    var objZuzMetaModel = [ZuzMetaModel]()
    var numberArray = ["(1)","(2)","(3)","(4)","(1)","(1)","(1)","(1)","(1)","(1)","(1)","(1)",]
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.juzDetails(forFilename: "Quranjson")
    }
    
    // MARK: - juzDetails
    func juzDetails(forFilename fileName: String) -> NSDictionary!{
        
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            if let data = NSData(contentsOf: url) {
                do {
                    let dictionary = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as? NSDictionary
                    
                    if let people = dictionary!["quran"] as? NSDictionary  {
                        let objQuaran = people["juzs"] as? NSDictionary
                        let objQuarter = objQuaran?["juz"] as! NSArray
                        for objDat in objQuarter{
                            let array = ZuzMetaModel.init(SuraData:objDat as! NSDictionary)
                            //                            let objModal = SuraDescriptionModel()
                            ////                            objModal.suraId = objDat["suraID"] as! String
                            self.objZuzMetaModel.append(array)
                            
                            print(objDat)
                        }
                    }
                    
                }
                    
                catch {
                    
                }
            }
          self.tableview.reloadData()
        }
        return nil
    }
}
// MARK: - Tableview datasource & delegates
extension JuzVC : UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objZuzMetaModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JuzCell") as! JuzCell
        
        cell.lbl_count?.text = objZuzMetaModel[indexPath.row].juzCount
        cell.costomView.layer.borderWidth = 2
        cell.costomView.layer.borderColor = UIColor.gray.cgColor
        cell.costomView.layer.masksToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96
    }
    
    
}


