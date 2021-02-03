//
//  ViewController.swift
//  PickerView
//
//  Created by 김재윤 on 2021/02/03.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let MAX_IMAGE_NUM = 10
    let PICKER_VIEW_COLLUM = 2
    let PICKER_VIEW_HEGIT:CGFloat = 80
    var imageFileName = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg","10.jpg"]
    var imageArray = [UIImage?]()
    
    
   
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var imageView: UIImageView!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0 ..< MAX_IMAGE_NUM{
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        lblImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
        
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat{
        return PICKER_VIEW_HEGIT
    }
    
    //returns the number of 'collums' to display
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLLUM
    }
    //returns the number of 'rows' in each component
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    //func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    //    return imageFileName[row]
    //}
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView{
        let imageView = UIImageView(image:imageArray[row])
        imageView.frame = CGRect(x: 0,y: 0, width: 100, height: 80)
        
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (component == 0){
            lblImageFileName.text = imageFileName[row]
        }
        else if (component==1){
            imageView.image = imageArray[row]
        }
    }
    
    

}

