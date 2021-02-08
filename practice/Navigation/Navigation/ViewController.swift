//
//  ViewController.swift
//  Navigation
//
//  Created by 김재윤 on 2021/02/05.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    let LampOn=UIImage(named:"lamp_on.png")
    let LampOff=UIImage(named:"lamp_off.png")
    @IBOutlet var txtMessage: UITextField!
    @IBOutlet var imageViewOfLamp: UIImageView!
    
    var isOn = true
    var isZoom = false
    
    let scale: CGFloat = 2.0
    var newWidth: CGFloat?
    var newHeight: CGFloat?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageViewOfLamp.image = LampOn
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            //버튼을 클릭한 경우
            editViewController.textWayValue = "segue : use button"
        }
        else if segue.identifier == "editBarButton"{
            //바 버튼을 클릭한 경우
            editViewController.textWayValue = "segue : use Bar button"
        }
        editViewController.textMessage = txtMessage.text!
        editViewController.isOn = isOn
        editViewController.delegate = self
        editViewController.isZoom = isZoom
        
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txtMessage.text = message
    }
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imageViewOfLamp.image = LampOn
            self.isOn = true
        }
        else {
            imageViewOfLamp.image = LampOff
            self.isOn = false
        }
    }
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool) {
        if isZoom{
            newWidth = imageViewOfLamp.frame.width*scale
            newHeight = imageViewOfLamp.frame.height*scale
            self.isZoom = isZoom
        }
        else{
            newWidth = imageViewOfLamp.frame.width/scale
            newHeight = imageViewOfLamp.frame.height/scale
            self.isZoom = isZoom
        }
        imageViewOfLamp.frame.size = CGSize(width: newWidth!, height: newHeight!)
    }

}

