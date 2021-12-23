//
//  CostomView.swift
//  My Islam App
//
//  Created by Apple on 29/01/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
@IBDesignable

class CostomView: UIView {

    @IBInspectable var borderWidth: CGFloat = 0.0{
        
        didSet{
            
            self.layer.borderWidth = borderWidth
        }
    }
    
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        
        didSet {
            
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        
        didSet {
            
            self.layer.cornerRadius = cornerRadius
        }
    }
  
    override func prepareForInterfaceBuilder() {
        
        super.prepareForInterfaceBuilder()
    }
}
