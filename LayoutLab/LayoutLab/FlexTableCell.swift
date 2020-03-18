//
//  TableCell.swift
//  LayoutLab
//
//  Created by apple on 2020/3/18.
//  Copyright © 2020 Chun Ta Chen. All rights reserved.
//

import Foundation
import UIKit
class FlexTableCell : UITableViewCell {
    
    static let reuseIdentifier = "FlexTableCell"

    fileprivate let nameLabel = UILabel()
    fileprivate let summaryLabel = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor.orange
        contentView.layer.borderWidth = 1
        
        separatorInset = .zero
        
        nameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        nameLabel.lineBreakMode = .byTruncatingTail
        nameLabel.layer.borderWidth = 1
        
        summaryLabel.font = UIFont.boldSystemFont(ofSize: 17)
        summaryLabel.lineBreakMode = .byTruncatingTail
        summaryLabel.layer.borderWidth = 1
        let oneImageView = UIImageView(image: UIImage(named: "flexlayout-logo"))
        contentView.flex.padding(0).define { (flex) in
            flex.addItem().direction(.row).define { (flex) in
                flex.addItem(nameLabel).marginLeft(6)
                flex.addItem(oneImageView).width(40).aspectRatio(of: oneImageView).marginLeft(6)
                flex.addItem(summaryLabel).marginLeft(6).marginRight(6).grow(1)
            }
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
    }
    
    func configure(rint: Int, r2int: Int) {
        // WARNING: After a control size may have been modified after a change, you must call flex.markDirty()
        //          to force flex to relayout the view. This is due to the high level of optimization of FlexLayout.
        nameLabel.text = String(format: "%d %d", rint, rint)
        nameLabel.flex.markDirty()
        
        summaryLabel.text = String(format: "%d %d", r2int, r2int)
        summaryLabel.flex.markDirty()
    }
    
    override func layoutSubviews() {
           super.layoutSubviews()
           layout()
       }
       
       fileprivate func layout() {
           contentView.flex.layout(mode: .adjustHeight)
       }
       
       override func sizeThatFits(_ size: CGSize) -> CGSize {
           // 1) Set the contentView's width to the specified size parameter
           contentView.pin.width(size.width)
           
           // 2) Layout contentView flex container
           layout()
           
           // Return the flex container new size
           return contentView.frame.size
       }
}
