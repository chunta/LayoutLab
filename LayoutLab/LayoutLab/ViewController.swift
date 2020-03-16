//
//  ViewController.swift
//  LayoutLab
//
//  Created by Chun Ta Chen on 2020/3/16.
//  Copyright © 2020 Chun Ta Chen. All rights reserved.
//

import UIKit
import GDPerformanceView_Swift
import FlexLayout
import PinLayout

class ViewController: UIViewController, PerformanceMonitorDelegate {

    fileprivate let rootFlexContainer = UIView()
    
    var fpxTxt:UILabel!
    
    override func loadView() {
        view = IntroView()
        
        fpxTxt = UILabel.init(frame: CGRect(x: 10, y: 450, width: 200, height: 50))
        view.addSubview(fpxTxt)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        PerformanceMonitor.shared().start()
        PerformanceMonitor.shared().delegate = self
    }

    func performanceMonitor(didReport performanceReport: PerformanceReport) {
        print(performanceReport.fps)
        fpxTxt.text = String(format:"FPS:%d CPU:%f", performanceReport.fps, performanceReport.cpuUsage)
    }

}

