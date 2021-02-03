//
//  ViewController.swift
//  AlarmTimer
//
//  Created by 김재윤 on 2021/02/03.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector :Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var selectedTime = ""
    var currentTime = ""
    var count=0
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblSelectTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
    }

    @IBAction func TimeSelector(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "h : mm aa"
        selectedTime = formatter.string(from :datePickerView.date)
        
        lblSelectTime.text = "선택시간 : "+selectedTime
    }
    
    @objc func updateTime() {
        //lblCurrentTime.text = String(count)
        //count = count + 1
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "h : mm aa"
        currentTime = formatter.string(from: date as Date)
        lblCurrentTime.text = "현재시간 : "+currentTime
        
        if (count==0){
            if (currentTime==selectedTime){
                let matchTimeAlram = UIAlertController(title: "알림", message: "설정된 시간입니다", preferredStyle: UIAlertController.Style.alert)
                let agree = UIAlertAction(title: "네 알겠습니다", style: UIAlertAction.Style.default, handler: nil)
                matchTimeAlram.addAction(agree)
                present(matchTimeAlram, animated: true, completion: nil)
                count = count + 1
            }
        }
        else {
            count = count + 1
            if (count==60){
                count = 0
            }
        }
    }
}

