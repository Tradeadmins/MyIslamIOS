//
//  UserDetailsViewController.swift
//  My Islam App
//
//  Created by Apple on 04/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import Foundation

class UserDetailsViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var surname: UITextField!
    @IBOutlet weak var text_Name: UITextField!
    @IBOutlet weak var tblTableview: UITableView!
    
    var GetAllDataInfo  = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        tblTableview.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        GetAllDataInfo = FMDBDatabaseModel.getInstance().GetAllData()
        tblTableview.reloadData()
    }

    @IBAction func btnInsertTapped(_ sender: Any) {
//        let FMDBInfo:Tbl_Info = Tbl_Info()
//        FMDBInfo.Name = text_Name.text!
////        FMDBInfo.Surname = surname.text!
//        print(FMDBInfo.Name)
//        let isInserted = FMDBDatabaseModel.getInstance().InsertData(FMDBInfo)
//        if isInserted == true {
//            Util.invokeAlertMethod(strTitle: "", strBody: "Insert data successfully", delegate: nil)
//        }else
//        {
//            Util.invokeAlertMethod(strTitle: "", strBody: "Error in inserting record", delegate: nil)
//        }
//        tblTableview.reloadData()
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GetAllDataInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell") as! InfoTableViewCell
//        cell.editData = self
        cell.tag = indexPath.row
        var l = Tbl_Info()
        l = GetAllDataInfo.object(at: indexPath.row) as! Tbl_Info
//          let a :String =
//        cell.quran_sno.text! = String(l.Id)
//        cell.lblName.text! = l.SuraName
//          cell.lblName.text! = "sonam"
//          cell.lblMobileNo.text! = l.MobileNo
//          cell.lblEmail.text! = l.Email
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

