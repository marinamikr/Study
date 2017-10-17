//
//  thirdViewController.swift
//  study
//
//  Created by User on 2017/02/12.
//  Copyright © 2017年 marina harada. All rights reserved.
//

import UIKit

class thirdViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var kamoku: UILabel!
    
    
    var subject: String = "a"
    var timer: Timer = Timer()
    var hun: Int = 0
    var byou: Int = 0
    var zi: Int = 0
    var newbyou: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kamoku.text = subject
        
        if !timer.isValid{
            
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(self.up),
                userInfo: nil,
                repeats: true
            )
            
        }
        
    }
    // Do any additional setup after loading the view.
    
    @IBAction func stop() {
        
        
        if timer.isValid{
            
            timer.invalidate()
            
        }
        
        print("newbyou\(newbyou)")
        
    }
    
    
    
    
    func up() {
        
        byou = byou + 1
        newbyou = newbyou + 1
        
        if byou >= 60{
            hun = hun + 1
            label1.text = String(hun)
            byou = byou % 60
            label.text = String(byou)
            
         if hun >= 60 {
            zi = zi + 1
            label2.text = String(zi)
            hun = hun % 60
            label1.text = String(hun)
            }
        
        }else{
            label.text = String(byou)
            }
        }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var fourthViewController = segue.destination as! fourthViewController
        fourthViewController.textz = String(zi)
        fourthViewController.texth = String(hun)
        fourthViewController.textb = String(byou)
        fourthViewController.subject = subject
        fourthViewController.byou = newbyou
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    //
}
