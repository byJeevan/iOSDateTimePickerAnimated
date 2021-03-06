//
//  ViewController.swift
//  DateTimePicker
//
//  Created by Huong Do on 9/16/16.
//  Copyright © 2016 ichigo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DateTimePickerDelegate {
    
    var picker: DateTimePicker?
    
    @IBAction func showDateTimePicker(sender: AnyObject) {
        let min = Date().addingTimeInterval(-60 * 60 * 24 * 4)
        let max = Date().addingTimeInterval(60 * 60 * 24 * 4)
        let picker = DateTimePicker.show(selected: Date(), minimumDate: min, maximumDate: max)
        picker.timeInterval = DateTimePicker.MinuteInterval.thirty
        picker.highlightColor = UIColor(red: 255.0/255.0, green: 138.0/255.0, blue: 138.0/255.0, alpha: 1)
        picker.darkColor = UIColor.darkGray
        picker.doneButtonTitle = "DONE"
        picker.doneBackgroundColor = UIColor(red: 255.0/255.0, green: 138.0/255.0, blue: 138.0/255.0, alpha: 1)
        picker.locale = Locale(identifier: "en_GB")
        
        picker.todayButtonTitle = "Today"
        picker.is12HourFormat = true
        let dateFormatToDisplay  = "dd/MM/YYYY" // "hh:mm aa dd/MM/YYYY"
        picker.dateFormat = dateFormatToDisplay
//        picker.isDatePickerOnly = true
//        picker.isTimePickerOnly = true
        
        picker.isAnimationEnabled = true
        picker.isTimeRangeEnabled = true 
        
        picker.includeMonth = false // if true the month shows at top
        picker.completionHandler = { date in
            let formatter = DateFormatter()
            formatter.dateFormat = dateFormatToDisplay
            self.title = formatter.string(from: date)
        }
        picker.delegate = self
        self.picker = picker
    }
    
    func dateTimePicker(_ picker: DateTimePicker, didSelectDate: Date) {
        title = picker.selectedDateString
        
        print("Date : \(picker.selectedDateString)")
        print("Custom Time Range : \(picker.selectedCustomTimeString) \n")
    }
}
