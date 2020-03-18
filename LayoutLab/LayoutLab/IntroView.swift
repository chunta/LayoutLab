//
//  IntroView.swift
//  LayoutLab
//
//  Created by Chun Ta Chen on 2020/3/16.
//  Copyright © 2020 Chun Ta Chen. All rights reserved.
//

import Foundation
import UIKit
import FlexLayout
import PinLayout

class IntroView: UIView {
    fileprivate let rootFlexContainer = UIView()

    init() {
        super.init(frame: .zero)
        backgroundColor = .white

        let imageView = UIImageView(image: UIImage(named: "flexlayout-logo"))
        let imageView2 = UIImageView(image: UIImage(named: "flexlayout-logo"))
        let imageView3 = UIImageView(image: UIImage(named: "flexlayout-logo"))
        
        let segmentedControl = UISegmentedControl(items: ["Intro", "FlexLayout", "PinLayout"])
        segmentedControl.selectedSegmentIndex = 0
        
        let label = UILabel()
        label.text = "Flexbox layouting is simple, powerfull and fast.\n\nFlexLayout syntax is concise and chainable."
        label.numberOfLines = 0
        
        let bottomLabel = UILabel()
        bottomLabel.text = "FlexLayout/yoga is incredibly fast, its even faster than manual layout."
        bottomLabel.numberOfLines = 0
        
        rootFlexContainer.flex.direction(.column).padding(12).define { (flex) in
            

            flex.addItem().direction(.row).padding(10).define { (flex) in
                flex.addItem(imageView2).width(100).aspectRatio(of: imageView)
                flex.addItem(imageView3).width(100).aspectRatio(of: imageView)
            }
        
            flex.addItem(bottomLabel).marginTop(12)
        }
        
        addSubview(rootFlexContainer)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        // Layout the flexbox container using PinLayout
        // NOTE: Could be also layouted by setting directly rootFlexContainer.frame
        rootFlexContainer.pin.top().horizontally().margin(pin.safeArea)

        // Then let the flexbox container layout itself
        rootFlexContainer.flex.layout(mode: .adjustHeight)
    }
}
