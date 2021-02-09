//
//  ViewController.swift
//  AutoLayout
//
//  Created by 김재윤 on 2021/02/09.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    var minutes :Int = 0
    var seconds :Int = 0
    let interval = 1.0
    var count = 0
    
    var isTimerGoing = false
    
 
    @IBOutlet var timePickerView: UIPickerView!
    @IBOutlet var lblLeftTimeZone: UILabel!
    @IBOutlet var lblTimerZone: UILabel!
    var leftTime = 0
    var timer:Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnTimerStart(_ sender: UIButton) {
        if isTimerGoing == false{
            isTimerGoing = true
            count = leftTime
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startTimer), userInfo: nil, repeats: true)
        }
        
    }
    
    @objc func startTimer(){
        if count <= 0 {
            timer?.invalidate()
            timer = nil
            isTimerGoing = false
        }
        else{
            
            let leftmin = count/60
            let leftsec = count - leftmin*60
            if leftmin==0{
                lblTimerZone.text = "남은시간 : "+String(leftsec) + " 초 "
            }
            else{
                lblTimerZone.text = "남은시간 : "+String(leftmin)+" 분 "+String(leftsec)+" 초"
            }
            count -= 1
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
                case 0:
                    return 60
                case 1:
                    return 60
                default:
                    return 0
                }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            switch component {
            case 0:
                return "\(row) 분"
            case 1:
                return "\(row) 초"
            default:
                return ""
            }
    
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            switch component {
            case 0:
                minutes = row
            case 1:
                seconds = row
            default:
                break;
            }
        lblLeftTimeZone.text = "남은시간 : "+String(minutes) + " 분 " + String(seconds) + "초"
        leftTime = minutes*60 + seconds
        }

}
