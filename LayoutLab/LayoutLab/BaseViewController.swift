//
//  BaseViewController.swift
//  LayoutLab
//
//  Created by Chun Ta Chen on 2020/3/16.
//  Copyright © 2020 Chun Ta Chen. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
