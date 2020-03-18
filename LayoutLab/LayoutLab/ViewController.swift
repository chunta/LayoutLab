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

class ViewController: UIViewController, PerformanceMonitorDelegate,
    UITableViewDelegate, UITableViewDataSource {

    fileprivate let rootFlexContainer = UIView()
    
    var fpxTxt:UILabel!
    
    @IBOutlet var tableView:UITableView!
    
    /*
    override func loadView() {
        view = IntroView()
        
        fpxTxt = UILabel.init(frame: CGRect(x: 10, y: 450, width: 200, height: 50))
        view.addSubview(fpxTxt)
        
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TableView
        tableView.register(FlexTableCell.self, forCellReuseIdentifier: FlexTableCell.reuseIdentifier)
        tableView.separatorStyle = .singleLine
        
        // Do any additional setup after loading the view.
        PerformanceMonitor.shared().start()
        PerformanceMonitor.shared().delegate = self
        
        fpxTxt = UILabel.init(frame: CGRect(x: 10, y: 450, width: 200, height: 50))
        view.addSubview(fpxTxt)
    }

    func performanceMonitor(didReport performanceReport: PerformanceReport) {
        fpxTxt.text = String(format:"FPS:%d CPU:%f", performanceReport.fps, performanceReport.cpuUsage)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
        //return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:FlexTableCell = tableView.dequeueReusableCell(withIdentifier: FlexTableCell.reuseIdentifier, for: indexPath) as! FlexTableCell
        let number = Int.random(in: 0 ..< 10000000000)
        cell.configure(rint: number, r2int: Int.random(in: 70 ..< 19000))
        return cell
    }
}

