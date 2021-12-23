//
//  SuraVC.swift
//  My Islam App
//
//  Created by Apple on 23/01/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit


class SuraVC: BaseViewController {
    static var SelectedVenueId  = String()
 
    @IBOutlet var objSuraViewModel: SuraViewModel!
    @IBOutlet weak var tableView: UITableView!
    
  
    override func viewDidLoad() {
    super.viewDidLoad()
        
    }
    
    override func setupScreenLayout()
    {
        objSuraViewModel.viewController = self
        self.objSuraViewModel.suraDetails(forFilename: "Quranjson")
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }
}
// MARK: - Tableview datasource & delegates
extension SuraVC : UITableViewDataSource,UITableViewDelegate{
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             return objSuraViewModel.objQuranSuraMetaModel.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "SuraCell") as! SuraCell
            cell.lblSuraEnglishName.text! = objSuraViewModel.objQuranSuraMetaModel[indexPath.row].suraNameEnglish
            cell.lblAyaCount.text! = objSuraViewModel.objQuranSuraMetaModel[indexPath.row].ayaCount
            cell.lblHeading.text! = objSuraViewModel.objQuranSuraMetaModel[indexPath.row].suraHeading
            cell.lblSuraArabicText.text! = objSuraViewModel.objQuranSuraMetaModel[indexPath.row].suraNameArabic
            return cell
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // Get Cell Label
            let indexPath = tableView.indexPathForSelectedRow
            let selectedIndexpath = indexPath!.row
            let vc = AppStoryboard.Faith.instance.instantiateViewController(withIdentifier: "AyaDetailsViewController") as! AyaDetailsViewController
            vc.selectedCellValue = selectedIndexpath
            vc.selectedSuraName  = objSuraViewModel.objQuranSuraMetaModel[indexPath!.row].suraNameEnglish
            self.navigationController?.pushViewController(vc, animated: true)
        }
    
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 96
        }
        
        
    }
    
    

