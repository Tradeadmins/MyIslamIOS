//
//  SuraViewModel.swift
//  My Islam App
//
//  Created by Apple on 14/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import SwiftyJSON

class SuraViewModel: NSObject {
    
    var objQuranSuraMetaModel = [QuranSuraMetaModel]()
    var viewController:SuraVC?
   
    func suraDetails(forFilename fileName: String) -> NSDictionary!{
        
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            if let data = NSData(contentsOf: url) {
                do {
                    let dictionary = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as? NSDictionary
                    
                    if let people = dictionary!["quran"] as? NSDictionary  {
                        let objQuaran = people["suras"] as? NSDictionary
                        let objQuarter = objQuaran?["sura"] as! NSArray
                        for objDat in objQuarter{
                            let array = QuranSuraMetaModel.init(SuraData:objDat as! NSDictionary)
                            //                            let objModal = SuraDescriptionModel()
                            ////                            objModal.suraId = objDat["suraID"] as! String
                            self.objQuranSuraMetaModel.append(array)
                            
                            print(objDat)
                           }
                        }
                    }
                    
                catch {
                    
                }
            }
            
        }
        
        return nil
    }
    
    
    
    
}
