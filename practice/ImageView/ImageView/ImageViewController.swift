//
//  ViewController.swift
//  ImageView
//
//  Created by 김재윤 on 2021/02/02.
//

import UIKit

class ImageViewController: UIViewController {
    var isZoom = false
    var imgOn: UIImage?
    var imgOff: UIImage?
    
    @IBOutlet var lightImage: UIImageView!
    @IBOutlet var btnResize: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        lightImage.image = imgOn
        
    }
    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale: CGFloat = 2.0
        var newWidth: CGFloat
        var newHeight: CGFloat
        
        if (isZoom) {
            newWidth = lightImage.frame.width/scale
            newHeight = lightImage.frame.height/scale
            btnResize.setTitle("확대", for: .normal)
        }
        else{
            newWidth = lightImage.frame.width*scale
            newHeight = lightImage.frame.height*scale
            btnResize.setTitle("축소", for: .normal)
            
        }
        lightImage.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn{
            lightImage.image = imgOn
        }
        else{
            lightImage.image = imgOff
        }
    }
}

