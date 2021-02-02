//
//  ViewController.swift
//  ImageViewer
//
//  Created by 김재윤 on 2021/02/02.
//

import UIKit

class ViewController: UIViewController {
    var maxImage = 4
    var nowImage = 1
    
    @IBOutlet var photoView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        photoView.image = UIImage(named: "1.JPG")
    }
    
    @IBAction func btnPrev(_ sender: UIButton) {
        nowImage = nowImage-1
        if (nowImage<1){
            nowImage = 4
        }
        let ImageName = String(nowImage)+".JPG"
        photoView.image = UIImage(named :ImageName)
    }
    @IBAction func btnNext(_ sender: UIButton) {
        nowImage = nowImage+1
        if (nowImage>4){
            nowImage = 1
        }
        let ImageName = String(nowImage)+".JPG"
        photoView.image = UIImage(named :ImageName)
    }
    
}

