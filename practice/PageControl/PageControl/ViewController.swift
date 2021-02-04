//
//  ViewController.swift
//  PageControl
//
//  Created by 김재윤 on 2021/02/04.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var myImageView: UIImageView!
    @IBOutlet var pageControler: UIPageControl!
    @IBOutlet var lblCurrentNumberOfPage: UILabel!
    
    let images = ["01.png","02.png","03.png","04.png","05.png","06.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControler.numberOfPages = images.count
        pageControler.currentPage = 0
        pageControler.pageIndicatorTintColor = UIColor.green
        pageControler.currentPageIndicatorTintColor = UIColor.systemPink
        myImageView.image = UIImage(named: "01.png")
        lblCurrentNumberOfPage.text = "0"
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        myImageView.image = UIImage(named: images[pageControler.currentPage])
        lblCurrentNumberOfPage.text = String(pageControler.currentPage)
    }
    
}

