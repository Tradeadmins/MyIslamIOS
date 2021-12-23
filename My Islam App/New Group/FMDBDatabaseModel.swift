//
//  FMDBDatabaseModel.swift
//  FMDBDatabase Demo
//
//  Created by Parth Changela on 22/06/17.
//  Copyright © 2017 Micropple. All rights reserved.
//

import Foundation
import UIKit

let sharedInstance = FMDBDatabaseModel()
class FMDBDatabaseModel: NSObject {

    var databese:FMDatabase? = nil

    class func getInstance() -> FMDBDatabaseModel
    {
        if (sharedInstance.databese == nil)
        {
        sharedInstance.databese = FMDatabase(path: Util.getPath(fileName: "Quran.sqlite"))
        }
        return sharedInstance
    }

    //MARK:- insert data into table

    func InsertData(_ Tbl_Info:Tbl_Info) -> Bool {
        sharedInstance.databese!.open()
        let isInserted = sharedInstance.databese!.executeUpdate("INSERT INTO QuranEnglish(Name) VALUES(?)", withArgumentsIn: [Tbl_Info.name])
        sharedInstance.databese!.close()
        return (isInserted != nil)

    }
    
    
    
    func GetSuraDesciption(suraId:Int) -> [SuraDescriptionModel] {
        sharedInstance.databese!.open()

        let resultSet:FMResultSet! = sharedInstance.databese!.executeQuery("SELECT  *from QuranWithSura WHERE Sura_ID = \(suraId)", withArgumentsIn: [0])
        var itemInfo = [SuraDescriptionModel]()
        if (resultSet != nil) {
            while resultSet.next() {
                let item:SuraDescriptionModel = SuraDescriptionModel()

                let suraId = Int(resultSet.int(forColumn: "Sura_ID"))

                if let strDescription: String =  resultSet.string(forColumn: "Desc") ?? "" {
                    item.suraDescription = strDescription
                    itemInfo.append(item)
                }
            }
        }

        sharedInstance.databese!.close()
        return itemInfo
    }
    
    func GetAllData() -> NSMutableArray {
        sharedInstance.databese!.open()
   
      let resultSet:FMResultSet! = sharedInstance.databese!.executeQuery("SELECT COUNT(Sura_ID),Sura_Name_English,Heading,Sura_Name_Arabic FROM QuranWithSura GROUP BY Sura_ID", withArgumentsIn: [0])
        let itemInfo:  NSMutableArray = NSMutableArray ()
        print(itemInfo)
        if (resultSet != nil) {
            while resultSet.next() {
                let item:Tbl_Info = Tbl_Info()
                
                item.suraId = Int(resultSet.int(forColumn: "COUNT(Sura_ID)"))
                print(item.suraId )
                if let strSuraNameEnglish: String =  resultSet.string(forColumn: "Sura_Name_English") ?? "" {

                    item.suraNameEnglish = strSuraNameEnglish
                }
                if let strSuraHeading: String =  resultSet.string(forColumn: "Heading") ?? "" {

                    item.suraHeading = strSuraHeading
                }
                if let strSuraNameArabic: String =  resultSet.string(forColumn: "Sura_Name_Arabic") ?? "" {

                    item.suraNameArabic = strSuraNameArabic
                }
                itemInfo.add(item)
            }
        }
   
        sharedInstance.databese!.close()
        return itemInfo
    }

//    func updateRecode(RecoreId:Int,Name:String,MobileNo:String,Email:String) -> NSMutableArray {
//        sharedInstance.databese!.open()
//
//        let resultSet:FMResultSet! = sharedInstance.databese!.executeQuery("UPDATE Info SET Name = ?,MobileNo = ?,Email = ? WHERE Id = ?", withArgumentsIn: [Name,MobileNo,Email,RecoreId])
//
//        let itemInfo:NSMutableArray = NSMutableArray ()
//        if (resultSet != nil)
//        {
//            while resultSet.next() {
//
//                let item:Tbl_Info = Tbl_Info()
//                item.Id = Int(resultSet.int(forColumn: "Id"))
//                item.Name = String(resultSet.string(forColumn: "Name")!)
//                item.MobileNo = String(resultSet.string(forColumn: "MobileNo")!)
//                item.Email = String(resultSet.string(forColumn: "Email")!)
//                itemInfo.add(item)
//            }
//        }
//
//        sharedInstance.databese!.close()
//        return itemInfo
//
//    }
//    func deleteRecode(RecoreId:Int) -> NSMutableArray {
//        sharedInstance.databese!.open()
//
//        let resultSet:FMResultSet! = sharedInstance.databese!.executeQuery("DELETE FROM Info WHERE Id = ?", withArgumentsIn: [RecoreId])
//
//        let itemInfo:NSMutableArray = NSMutableArray ()
//        if (resultSet != nil)
//        {
//            while resultSet.next() {
//
//                let item:Tbl_Info = Tbl_Info()
//                item.Id = Int(resultSet.int(forColumn: "Id"))
//                item.Name = String(resultSet.string(forColumn: "Name")!)
//                item.MobileNo = String(resultSet.string(forColumn: "MobileNo")!)
//                item.Email = String(resultSet.string(forColumn: "Email")!)
//                itemInfo.add(item)
//            }
//        }
//
//        sharedInstance.databese!.close()
//        return itemInfo
//
//    }
}
