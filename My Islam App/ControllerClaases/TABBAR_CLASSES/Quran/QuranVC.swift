//
//  QuranVC.swift
//  My Islam App
//
//  Created by Apple on 23/01/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import CarbonKit

class QuranVC: BaseViewControllerLeft {
    // MARK: - property declaration
    let purpleInspireColor = UIColor.init(red: 24/255.0, green: 33/255.0, blue: 44/255.0, alpha: 1.0)
    let yellow = UIColor.init(red: 218/255.0, green: 175/255.0, blue: 2/255.0, alpha: 1.0)
  //let items = ["SURA", "jUZ", "MY QURAN"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
         // addSlideMenuButton()
          self.addTitleViewButton(title: "14 Oct 2019 Fjar:5:00")
          addBackButton(isOpenMenu: true)
//        let items = ["SURA","JUZ","MY QURAN"]
//        let carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items, delegate: self)
//        carbonTabSwipeNavigation.insert(intoRootViewController: self)
//        carbonTabSwipeNavigation.carbonSegmentedControl?.widthForSegment(at: 0)
//        carbonTabSwipeNavigation.setIndicatorColor(yellow)
//        carbonTabSwipeNavigation.setSelectedColor(yellow, font: UIFont.systemFont(ofSize: 16))
//        carbonTabSwipeNavigation.setTabExtraWidth(70)
//        carbonTabSwipeNavigation.setNormalColor(yellow, font: UIFont.systemFont(ofSize: 16))
//        carbonTabSwipeNavigation.carbonSegmentedControl?.backgroundColor = UIColor.clear
//        carbonTabSwipeNavigation.toolbar.barTintColor = UIColor.clear
//        carbonTabSwipeNavigation.toolbar.isTranslucent = false
//        carbonTabSwipeNavigation.carbonTabSwipeScrollView.backgroundColor = UIColor.black
//        carbonTabSwipeNavigation.carbonTabSwipeScrollView.bounces = true
        
    }
  
    override func openMenu(sender: UIButton) {
         onSlideMenuButtonPressed(sender)
    }
//    // MARK: - navigation swipe method
//    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
//
//        if index == 0{
//            return  UIStoryboard(name: "Faith", bundle: nil).instantiateViewController(withIdentifier: "SuraVC")
//        } else if index == 1{
//            return  UIStoryboard(name: "Faith", bundle: nil).instantiateViewController(withIdentifier: "JuzVC")
//        }
//        return  UIStoryboard(name: "Faith", bundle: nil).instantiateViewController(withIdentifier: "MyQuranVC")
//
//    }
  
}
