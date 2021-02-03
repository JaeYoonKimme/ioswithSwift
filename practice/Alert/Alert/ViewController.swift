//
//  ViewController.swift
//  Alert
//
//  Created by 김재윤 on 2021/02/03.
//

import UIKit

class ViewController: UIViewController {
    let imgLampOn = UIImage(named :"lamp-on.png")
    let imgLampOff = UIImage(named:"lamp-off.png")
    let imgLampRemove = UIImage(named:"lamp-remove.png")
    
    var isLampOn = true
    
    @IBOutlet var lampImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lampImg.image = imgLampOn
    }
    @IBAction func btnLampOn(_ sender: UIButton) {
        if (isLampOn){
            //alert user that lamp is already on
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 ON 상태입니다", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "알겠다", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        }
        else{
            lampImg.image = imgLampOn
            isLampOn=true
        }
    }
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        if (isLampOn){
            lampImg.image = imgLampOff
            isLampOn=false
        }
        else{
            //alert user that lamp is already off
            let LampOffAlert = UIAlertController(title: "경고", message: "현재 OFF 상태입니다", preferredStyle: UIAlertController.Style.alert)
            let LampOffAction = UIAlertAction(title: "알겠다", style: UIAlertAction.Style.default, handler: nil)
            LampOffAlert.addAction(LampOffAction)
            
            present(LampOffAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnLampRemove(_ sender: UIButton) {
        //alert user three option (on lamp, off lamp, remove)
        let LampRemoveAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let OnAction = UIAlertAction(title: "램프 켜기", style: UIAlertAction.Style.default, handler :{
            ACTION in self.lampImg.image = self.imgLampOn
            self.isLampOn=true
        })
        let OffAction = UIAlertAction(title: "램프 끄기", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image = self.imgLampOff
            self.isLampOn=false
        })
        let RemoveAction = UIAlertAction(title: "램프 지우기", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image = self.imgLampRemove
            self.isLampOn = false
        })
        
        LampRemoveAlert.addAction(OnAction)
        LampRemoveAlert.addAction(OffAction)
        LampRemoveAlert.addAction(RemoveAction)
        present(LampRemoveAlert, animated: true, completion: nil)
    }
}

