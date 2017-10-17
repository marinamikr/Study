//
//  ViewController.swift
//  study
//
//  Created by User on 2017/02/12.
//  Copyright © 2017年 marina harada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var saveDate: UserDefaults = UserDefaults.standard
    
    var japanese: Int = 0
    var math: Int = 0
    var science: Int = 0
    var syakai111: Int = 0
    var english: Int = 0
    var sonota111: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    struct Segment {
        
        // MARK: セグメントの背景色
        var color : UIColor
        
        // MARK: セグメントの割合を設定する変数（比率）
        var value : CGFloat
        
        
    }
    
    class PieChartView: UIView {
        var segments = [Segment]() {
            didSet {
                setNeedsDisplay()
            }
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            isOpaque = false
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
        
        override func draw(_ rect: CGRect) {
            
            // MARK: CGContextの初期化
            let ctx = UIGraphicsGetCurrentContext()
            
            // MARK: 円型にするためにradiusを設定
            let radius = min(frame.size.width, frame.size.height)/2
            
            // MARK: Viewの中心点を取得
            let viewCenter = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
            
            // MARK: セグメント
            //ごとの比率に応じてグラフを変形するための定数
            let valueCount = segments.reduce(0) {$0 + $1.value}
            
            // MARK: 円グラフの起点を設定 [the starting angle is -90 degrees (top of the circle, as the context is flipped). By default, 0 is the right hand side of the circle, with the positive angle being in an anti-clockwise direction (same as a unit circle in maths).]
            var startAngle = -CGFloat(M_PI*0.5)
            
            // MARK: 初期化されたすべてのセグメントを描画するための処理
            for segment in segments { // loop through the values array
                ctx?.setFillColor(segment.color.cgColor)
                let endAngle = startAngle+CGFloat(M_PI*2)*(segment.value/valueCount)
                ctx?.move(to: CGPoint(x:viewCenter.x, y: viewCenter.y))
                ctx?.addArc(center: CGPoint(x:viewCenter.x, y: viewCenter.y), radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
                ctx?.fillPath()
                startAngle = endAngle
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let pieChartView = PieChartView()
        pieChartView.frame = CGRect(x: 0, y: 80, width: view.frame.size.width, height: 200)
        
        pieChartView.segments = [
            Segment(color: UIColor(colorLiteralRed: 255 / 255, green: 171 / 255, blue: 78 / 255, alpha: 1.0), value:
                CGFloat(saveDate.object(forKey: "kokugo") as! Int)),
            Segment(color: UIColor(colorLiteralRed: 21 / 255, green: 247 / 255, blue: 240 / 255, alpha: 1.0), value:
                CGFloat(saveDate.object(forKey: "suugaku") as! Int)),
            Segment(color: UIColor(colorLiteralRed: 255 / 255, green: 130 / 255, blue: 184 / 255, alpha: 1.0), value:
                CGFloat(saveDate.object(forKey: "eigo") as! Int)),
            Segment(color: UIColor(colorLiteralRed: 202, green: 134 / 250, blue: 255 / 255, alpha: 1.0), value:
                CGFloat(saveDate.object(forKey: "rika") as! Int)),
            Segment(color: UIColor(colorLiteralRed: 139 / 255, green: 255 / 255, blue: 153 / 255, alpha: 1.0), value:
                CGFloat(saveDate.object(forKey: "syakai") as! Int)),
            Segment(color: UIColor(colorLiteralRed: 255 / 255, green: 252 / 255, blue: 152 / 255, alpha: 1.0),value:
                CGFloat(saveDate.object(forKey: "sonota") as! Int)),
            
        ]
        view.addSubview(pieChartView)
    }
}
