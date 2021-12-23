//
//  CalenderViewController.swift
//  My Islam App
//
//  Created by Apple on 18/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import Foundation
class CalenderViewController: UIViewController {
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var showCalendarButton: UIButton!
    
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E dd LLLL"
        return formatter
    }()
   
    
    private lazy var calendarPopup: CalendarPopUpView = {
        let frame = CGRect(
            x: 15,
            y: 70,
            width: view.frame.width - 30,
            height: 365
        )
        let calendar = CalendarPopUpView(frame: frame)
        calendar.backgroundColor = .clear
        calendar.layer.shadowColor = UIColor.black.cgColor
        calendar.layer.shadowOpacity = 0.4
        calendar.layer.shadowOffset = .zero
        calendar.layer.shadowRadius = 5
        calendar.didSelectDay = { [weak self] date in
            self?.setSelectedDate(date)
        }
        
        return calendar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(
            red: 240 / 255,
            green: 240 / 255,
            blue: 240 / 255,
            alpha: 1.0
        )
        setSelectedDate(Date())
        view.addSubview(calendarPopup)
       //
    }
    
  
    
    private func setSelectedDate(_ date: Date) {
        //dayLabel.text = formatter.string(from: date)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
