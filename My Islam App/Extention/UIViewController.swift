//
//  UIViewController.swift
//  My Islam App
//
//  Created by Apple on 21/01/19.
//  Copyright © 2019 Apple. All rights reserved.
//
import UIKit
import Foundation

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
     }
    @objc func dismissKeyboard() {
        view.endEditing(true)
     }
    func setLayer(view: Any, cornerRadius: Int, isCornerRadius: Bool, borderWidth: Int,borderColor: UIColor){
        if view is UIView {
            let v = view as! UIView
            if isCornerRadius == true{
                v.layer.cornerRadius = v.frame.height/2
            }
            v.layer.cornerRadius = v.frame.height/CGFloat(cornerRadius)
            v.layer.borderWidth = CGFloat(borderWidth)
            v.layer.borderColor =  borderColor.cgColor
            v.clipsToBounds = true
            v.layer.masksToBounds = true
        }
    }
    public func createBorderForView(view: UIView,color: UIColor, radius: CGFloat, width: CGFloat = 0.7) {
        view.layer.borderWidth = width
        view.layer.cornerRadius = radius
        view.layer.shouldRasterize = false
        view.layer.rasterizationScale = 2
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        let cgColor: CGColor = color.cgColor
        view.layer.borderColor = cgColor
    }
    

func shake(textfield:UITextField,lblBoarder:UILabel,lblHint:UILabel)
{
    let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
    animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
    animation.duration = 0.6
    animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
    textfield.layer.add(animation, forKey: "shake")
    lblBoarder.layer.add(animation, forKey: "shake")
    lblHint.layer.add(animation, forKey: "shake")
    
    textfield.textColor = UIColor.red
    lblBoarder.backgroundColor = UIColor.red
    lblHint.textColor = UIColor.red
    
}
    

    func addTitleViewButton(title: String) {
        let button =  UIButton(type: .custom)
        button.frame = CGRect(x: 40, y: 0, width: 100, height: 40)
        button.backgroundColor = UIColor.clear
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont(name: "SFUIDisplay-Medium", size: 17)
        button.addTarget(self, action: #selector(actionTitleViewButton), for: .touchUpInside)
        self.navigationItem.titleView = button
    }
    
    @objc func actionTitleViewButton() {
        // Register Nib
        let newViewController = CalenderViewController(nibName: "CalenderViewController", bundle: nil)
        self.present(newViewController, animated: true, completion: nil)
    }
    
    func addBackButton(isOpenMenu:Bool) {
        let leftButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "unchecked-radio-button--v1"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(openMenu(sender:)))
        if isOpenMenu == true {
             leftButton.tag = 12
        }else{
             leftButton.tag = 13
        }
       
        self.navigationItem.leftBarButtonItem = leftButton
    }
      @objc func openMenu(sender:UIButton) {
        
      }
}
