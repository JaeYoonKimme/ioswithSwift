//
//  EditViewController.swift
//  Navigation
//
//  Created by 김재윤 on 2021/02/05.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool)
}

class EditViewController: UIViewController {
    var textWayValue:String = ""
    var textMessage:String = ""
    var delegate : EditDelegate?
    @IBOutlet var btnZoomValue: UIButton!
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var txtMessage: UITextField!
    @IBOutlet var switchOfLamp: UISwitch!
    
    var isOn = false
    var isZoom = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblWay.text = textWayValue
        txtMessage.text = textMessage
        switchOfLamp.isOn = isOn
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        if (delegate != nil){
            delegate?.didMessageEditDone(self, message: txtMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnZoom(_ sender: UIButton) {
        if isZoom == false{
            btnZoomValue.setTitle("확대", for: .normal)
            isZoom = true
        }
        else{
            btnZoomValue.setTitle("축소", for: .normal)
            isZoom = false 
        }
    
        //if (delegate != nil){
            //delegate?.didImageZoomDone(self, isZoom: isZoom)
        //}
    }
    
    @IBAction func switchLampOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        }
        else{
            isOn = false
        }
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
