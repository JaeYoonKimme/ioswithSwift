//
//  ViewController.swift
//  DatePicker
//
//  Created by 김재윤 on 2021/02/03.
//

import UIKit

class DateViewController: UIViewController {
    let timeSelector :Selector = #selector(DateViewController.updateTime)
    let interval = 1.0
    var count = 0
    var currentTime :String = ""
    var selectTime :String = ""
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "a HH:mm"
        selectTime=formatter.string(from: datePickerView.date)
        lblPickerTime.text = "선택시간 : "+selectTime
        
    }
    
    @objc func updateTime() {
        //lblCurrentTime.text = String(count)
        //count = count + 1
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "a HH:mm"
        currentTime = formatter.string(from: date as Date)
        lblCurrentTime.text = "현재시간 : "+currentTime
        
        
        if (currentTime == selectTime){
            view.backgroundColor = UIColor.red
        }
        else{
            view.backgroundColor = UIColor.white
        }
    }
    

}

