//
//  AyaDetailsViewController.swift
//  My Islam App
//
//  Created by Apple on 14/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class AyaDetailsViewController: BaseViewController {
    // MARK: - property declaration
    var selectedCellValue:Int = 0
    var selectedSuraName:String = ""
 
    // MARK: - IBOutlet
    @IBOutlet weak var lblSuraEnglishName: UILabel!
    @IBOutlet var objAyaDetailsViewModel: AyaDetailsViewModel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Controller lyfe cyle
    override func viewDidLoad() {
        super.viewDidLoad()
        lblSuraEnglishName.text = selectedSuraName
        
    }
    
    override func setupScreenLayout(){
        objAyaDetailsViewModel.viewController  = self
        self.objAyaDetailsViewModel.GetAyaDescriptionInEnglish()
        self.objAyaDetailsViewModel.ayaArabicDescription(forFilename: "Arabic")
        tableView.dataSource = self
        tableView.delegate = self
    }
    // MARK: - IBActions
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Tableview datasource & delegates
extension AyaDetailsViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objAyaDetailsViewModel.selectedSura?.Ayats.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SuraDetaillCell") as! SuraDetaillCell
        
        let ayat = objAyaDetailsViewModel.selectedSura?.Ayats[indexPath.row]
        let ayatArabic = objAyaDetailsViewModel.selectedSuraArabic?.ayatsArabic[indexPath.row]
        cell.lblAyaEnglishDescription.text! = ayat?.text ?? ""
        cell.lblAyaIndex.text! = ayat?.index ?? ""
        cell.lblAyaArabicDescription.text! = ayatArabic?.text ?? ""
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        
    }
    
}
