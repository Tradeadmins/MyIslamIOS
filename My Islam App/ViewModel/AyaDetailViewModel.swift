//
//  AyaDetailViewModel.swift
//  My Islam App
//
//  Created by Apple on 14/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import SwiftyJSON

class AyaDetailsViewModel: NSObject {
    
    var viewController : AyaDetailsViewController?
    var suras: [Sura] = []
    var objSuraArabicDetails: [SuraArabicDetails] = []
    var selectedSura:Sura?
    var selectedSuraArabic: SuraArabicDetails?
    
    func GetAyaDescriptionInEnglish(){
            let url = Constant.QuranDescriptionInEnglish
            ApiResponse.onResponseGet(url: url) { (response, error) in
    
                if let qurandata = response["quran"] as? [String:Any]{
                    if let suraData = qurandata["sura"] as? [[String:Any]]
                    {
                        for sura in suraData {
                            let sura1 = Sura()
                            sura1.text = sura["_name"] as? String ?? ""
    
                            if let arrAya = sura["aya"] as? [[String:Any]]{
                                for aya in arrAya {
                                    let aya1 = Ayat()
                                    aya1.text = aya["_text"] as? String
//                                    aya1.index = Int(aya["_index"] as? String ?? "0") ?? 0
                                    aya1.index = aya["_index"] as? String
                                    sura1.Ayats.append(aya1)
                                }
                            }
                            self.suras.append(sura1)
                        }
                    }
                }
                self.selectedSura = self.suras[(self.viewController?.selectedCellValue)!]
                DispatchQueue.main.async {
                    self.viewController?.tableView.reloadData()
                }
    
            }
       }
    
    
    func ayaArabicDescription(forFilename fileName: String) -> NSDictionary!{
        
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            if let data = NSData(contentsOf: url) {
                do {
                    let dictionary = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as? NSDictionary
                    
                    if let qurandata = dictionary?["quran"] as? [String:Any]{
                        if let suraData = qurandata["sura"] as? [[String:Any]]
                        {
                            for sura in suraData {
                                let sura1 = SuraArabicDetails()
                                sura1.text = sura["_name"] as? String ?? ""
                                
                                if let arrAya = sura["aya"] as? [[String:Any]]{
                                    for aya in arrAya {
                                        let aya1 = AyatArabicDetails()
                                        aya1.text = aya["_text"] as? String
                                        //                                    aya1.index = Int(aya["_index"] as? String ?? "0") ?? 0
                                        aya1.index = aya["_index"] as? String
                                        sura1.ayatsArabic.append(aya1)
                                    }
                                }
                                self.objSuraArabicDetails.append(sura1)
                            }
                        }
                    }
               
                    

                }
                    
                catch {
                    
                }
            }
            self.selectedSuraArabic = self.objSuraArabicDetails[(self.viewController?.selectedCellValue)!]
            DispatchQueue.main.async {
                self.viewController?.tableView.reloadData()
            }
            
            
        }
        
        return nil
    }
    
   
    
    func GetAyaDescriptionInArabic(){
        let url = Constant.QuranDescriptionInEnglish
        ApiResponse.onResponseGet(url: url) { (response, error) in
            
            if let qurandata = response["quran"] as? [String:Any]{
                if let suraData = qurandata["sura"] as? [[String:Any]]
                {
                    for sura in suraData {
                        let sura1 = Sura()
                        sura1.text = sura["_name"] as? String ?? ""
                        
                        if let arrAya = sura["aya"] as? [[String:Any]]{
                            for aya in arrAya {
                                let aya1 = Ayat()
                                aya1.text = aya["_text"] as? String
                                //                                    aya1.index = Int(aya["_index"] as? String ?? "0") ?? 0
                                aya1.index = aya["_index"] as? String
                                sura1.Ayats.append(aya1)
                            }
                        }
                        self.suras.append(sura1)
                    }
                }
            }
            self.selectedSura = self.suras[(self.viewController?.selectedCellValue)!]
            DispatchQueue.main.async {
                self.viewController?.tableView.reloadData()
            }
            
        }
    }
    
}

