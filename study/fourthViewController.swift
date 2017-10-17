//
//  fourthViewController.swift
//  study
//
//  Created by User on 2017/02/12.
//  Copyright © 2017年 marina harada. All rights reserved.
//

import UIKit

class fourthViewController: UIViewController {
    var saveDate: UserDefaults = UserDefaults.standard
    
    
    @IBOutlet var label: UILabel!
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var kamoku2: UILabel!
    
    var texth: String?
    var textb: String?
    var textz: String?
    var subject: String = "b"
    var byou: Int!
    var kokugobyo: Int = 0
    var suugakubyo: Int = 0
    var eigobyo: Int = 0
    var syakaibyo: Int = 0
    var rikabyo: Int = 0
    var sonotabyo: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(subject)
        print("view4")
        label2.text = textz
        label1.text = texth
        label.text = textb
        kamoku2.text = subject
        
        if subject == "国語"{
            kokugobyo = byou
            print("kokugobyou\(kokugobyo)")
            
        }else if subject == "数学" {
            suugakubyo = byou
            
        }else if subject == "英語"{
            eigobyo = byou
            
        }else if subject == "理科"{
            rikabyo = byou
            
        }else if subject == "社会"{
            syakaibyo = byou
            
        }else{
            subject == "その他"
            sonotabyo = byou
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var fifthViewController = segue.destination as! fifthViewController
        fifthViewController.kokugobyou = kokugobyo
        fifthViewController.suugakubyou = suugakubyo
        fifthViewController.eigobyou = eigobyo
        fifthViewController.syakaibyou = syakaibyo
        fifthViewController.rikabyou = rikabyo
        fifthViewController.sonotabyou = sonotabyo
        
        
    }
    
    @IBAction func modoru(){
        var japanese = 0
        if saveDate.object(forKey: "kokugo") != nil{
            japanese = saveDate.object(forKey: "kokugo") as! Int
            japanese = japanese + kokugobyo
            print("japanese\(japanese)")
            
        }else{
            japanese = kokugobyo
        }
        saveDate.set(japanese, forKey: "kokugo")
        saveDate.synchronize()
        
        var math = 0
        if saveDate.object(forKey: "suugaku") != nil{
            math = saveDate.object(forKey: "suugaku") as! Int
            math = math + suugakubyo
        }else{
            math = suugakubyo
        }
        
        saveDate.set(math, forKey: "suugaku")
        saveDate.synchronize()
        
        var science = 0
        if saveDate.object(forKey: "rika") != nil{
            science = saveDate.object(forKey: "rika") as! Int
            science = science + rikabyo
        }else{
            science = rikabyo
        }
        saveDate.set(science, forKey: "rika")
        saveDate.synchronize()
        
        
        var syaki111 = 0
        
        if saveDate.object(forKey: "syakai") != nil{
            syakaibyo = saveDate.object(forKey: "syakai") as! Int
            syaki111 = syaki111 + syakaibyo
        }else{
            byou = syakaibyo
            
        }
        saveDate.set(syaki111, forKey: "syakai")
        saveDate.synchronize()
        
        var english = 0
        
        if saveDate.object(forKey: "eigo") != nil{
            english = saveDate.object(forKey: "eigo") as! Int
            english = english + eigobyo
            byou = english
        }else{
            byou = eigobyo
        }
        saveDate.set(eigobyo, forKey: "eigo")
        saveDate.synchronize()
        
        var sonota111 = 0
        if saveDate.object(forKey: "sonota") != nil{
            sonota111 = saveDate.object(forKey: "sonota") as! Int
            sonota111 = sonota111 + sonotabyo
        }else{
            byou = sonotabyo
        }
        
        saveDate.set(sonota111, forKey: "sonota")
        saveDate.synchronize()
     
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
