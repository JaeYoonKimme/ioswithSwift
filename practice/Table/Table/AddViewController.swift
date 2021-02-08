//
//  AddViewController.swift
//  Table
//
//  Created by 김재윤 on 2021/02/08.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var txtFieldItemAdd: UITextField!
    var imageName = ["cart.png","clock.png","pencil.png"]
    var imageArray = [UIImage?]()
    var selectedImage :String = "cart.png"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for i in 0..<3{
            let image = UIImage(named: imageName[i])
            imageArray.append(image)
        }
    }
    
    @IBAction func btnAdd(_ sender: UIButton) {
        items.append(txtFieldItemAdd.text!)
        itemsImageFile.append(selectedImage)
        txtFieldItemAdd.text = ""
        _ = navigationController?.popViewController(animated: true)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat{
        return 80
    }
    
    //returns the number of 'collums' to display
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //returns the number of 'rows' in each component
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageName.count
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
        selectedImage = itemsImageFile[row]
    }

}
