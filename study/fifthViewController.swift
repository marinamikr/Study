//
//  fifthViewController.swift
//  study
//
//  Created by User on 2017/06/25.
//  Copyright © 2017年 marina harada. All rights reserved.
//

import UIKit

class fifthViewController: UIViewController {
    
    var saveDate: UserDefaults = UserDefaults.standard
    
    @IBOutlet var kokugo1: UILabel!
    @IBOutlet var kokugo2: UILabel!
    @IBOutlet var kokugo3: UILabel!
    @IBOutlet var suugaku1: UILabel!
    @IBOutlet var suugaku2: UILabel!
    @IBOutlet var suugaku3: UILabel!
    @IBOutlet var eigo1: UILabel!
    @IBOutlet var eigo2: UILabel!
    @IBOutlet var eigo3: UILabel!
    @IBOutlet var rika1: UILabel!
    @IBOutlet var rika2: UILabel!
    @IBOutlet var rika3: UILabel!
    @IBOutlet var syakai1: UILabel!
    @IBOutlet var syakai2: UILabel!
    @IBOutlet var syakai3: UILabel!
    @IBOutlet var sonota1: UILabel!
    @IBOutlet var sonota2: UILabel!
    @IBOutlet var sonota3: UILabel!
    
    
    var kokugobyou: Int = 0
    var suugakubyou: Int = 0
    var syakaibyou: Int = 0
    var rikabyou: Int = 0
    var eigobyou: Int = 0
    var sonotabyou: Int = 0
    var zi: Int = 0
    var hun: Int = 0
    var byou: Int = 0
    var japanese: Int = 0
    var math: Int = 0
    var science: Int = 0
    var syakai111: Int = 0
    var english: Int = 0
    var sonota111: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        kokugo()
        suugaku()
        eigo()
        syakai()
        rika()
        sonota()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func kokugo(){
        
        if saveDate.object(forKey: "kokugo") != nil{
            japanese = saveDate.object(forKey: "kokugo") as! Int
            japanese = japanese + kokugobyou
            print("japanese\(japanese)")
            byou = japanese
        }else{
            byou = kokugobyou
        }
        saveDate.set(japanese, forKey: "kokugo")
        saveDate.synchronize()
        
        
        if byou >= 60{
            hun = byou / 60
            kokugo2.text = String(hun)
            print("hun\(hun)")
            byou = byou % 60
            kokugo3.text = String(byou)
            
            if hun >= 60 {
                zi = hun / 60
                kokugo1.text = String(zi)
                hun = hun % 60
                kokugo2.text = String(hun)
            }
            
        }else{
            kokugo3.text = String(byou)
        }
        
        
    }
    
    func suugaku(){
        
        if saveDate.object(forKey: "suugaku") != nil{
            math = saveDate.object(forKey: "suugaku") as! Int
            math = math + suugakubyou
            byou = math
        }else{
            byou = suugakubyou
        }
        
        saveDate.set(math, forKey: "suugaku")
        saveDate.synchronize()
        
        if byou >= 60{
            hun = byou / 60
            suugaku2.text = String(hun)
            print("hun\(hun)")
            byou = byou % 60
            suugaku3.text = String(byou)
            
            if hun >= 60 {
                zi = hun / 60
                suugaku1.text = String(zi)
                hun = hun % 60
                suugaku2.text = String(hun)
            }
            
        }else{
            suugaku3.text = String(byou)
        }
        
        
    }
    
    func eigo(){
        
        if saveDate.object(forKey: "eigo") != nil{
            english = saveDate.object(forKey: "eigo") as! Int
            english = english + eigobyou
            byou = english
        }else{
            byou = eigobyou
        }

        saveDate.set(english, forKey: "eigo")
        saveDate.synchronize()
        
        if byou >= 60{
            hun = byou / 60
            eigo2.text = String(hun)
            print("hun\(hun)")
            byou = byou % 60
            eigo3.text = String(byou)
            
            if hun >= 60 {
                zi = hun / 60
                eigo1.text = String(zi)
                hun = hun % 60
                eigo2.text = String(hun)
            }
            
        }else{
            eigo3.text = String(byou)
        }
        
        
    }
    
    func rika(){
        
        if saveDate.object(forKey: "rika") != nil{
            science = saveDate.object(forKey: "rika") as! Int
            science = science + rikabyou
            byou = science
        }else{
            byou = rikabyou
        }
        
                
        if byou >= 60{
            hun = byou / 60
            rika2.text = String(hun)
            print("hun\(hun)")
            byou = byou % 60
            rika3.text = String(byou)
            
            if hun >= 60 {
                zi = hun / 60
                rika1.text = String(zi)
                hun = hun % 60
                rika2.text = String(hun)
            }
            
        }else{
            rika3.text = String(byou)
        }
        
        
    }
    
    func syakai(){
        
        if saveDate.object(forKey: "syakai") != nil{
            syakai111 = saveDate.object(forKey: "syakai") as! Int
            syakai111 = syakai111 + syakaibyou
            byou = syakai111
        }else{
            byou = syakaibyou
            
        }

        saveDate.set(syakai111, forKey: "syakai")
        saveDate.synchronize()
        
        if byou >= 60{
            hun = byou / 60
            syakai2.text = String(hun)
            print("hun\(hun)")
            byou = byou % 60
            syakai3.text = String(byou)
            
            if hun >= 60 {
                zi = hun / 60
                syakai1.text = String(zi)
                hun = hun % 60
                syakai2.text = String(hun)
            }
            
        }else{
            syakai3.text = String(byou)
        }
        
        
    }
    
    func sonota(){
        
        if saveDate.object(forKey: "sonota") != nil{
            sonota111 = saveDate.object(forKey: "sonota") as! Int
            sonota111 = sonota111 + sonotabyou
            byou = sonota111
        }else{
            byou = sonotabyou
        }
        
        saveDate.set(sonota111, forKey: "sonota")
        saveDate.synchronize()
        
        if byou >= 60{
            hun = byou / 60
            sonota2.text = String(hun)
            print("hun\(hun)")
            byou = byou % 60
            sonota3.text = String(byou)
            
            if hun >= 60 {
                zi = hun / 60
                sonota1.text = String(zi)
                hun = hun % 60
                sonota2.text = String(hun)
            }
            
        }else{
            sonota3.text = String(byou)
        }
        
        
    }
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
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
