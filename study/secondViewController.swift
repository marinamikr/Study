//
//  secondViewController.swift
//  study
//
//  Created by User on 2017/02/12.
//  Copyright © 2017年 marina harada. All rights reserved.
//

import UIKit

class secondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet var picker: UIPickerView!
    
    
    var pickerData = ["japanese", "math", "English", "science", "social studies", "others"]
    var classRow: Int = 0
    
    var redArray: [Float] = [1, 0, 0.5, 0.5, 0, 0]
    let greenArray: [Float] = [0, 0, 0.3, 0, 0.3, 0]
    let blueArray: [Float] = [0, 1, 0.2, 0.6, 0, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView{
    
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 50))
        label.textAlignment = .center
        label.text = pickerData[row]
        
        let red = redArray[row]
        let green = greenArray[row]
        let blue = blueArray[row]
        
        label.textColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
        
        print("row\(row)")
        
        return label
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        classRow = row
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var thirdViewController = segue.destination as! thirdViewController
        thirdViewController.subject = "\(pickerData[classRow])"
    }
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }

    
    
}

