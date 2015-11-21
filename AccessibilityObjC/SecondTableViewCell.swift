//
//  SecondTableViewCell.swift
//  AccessabilityTest
//
//  Created by Yung Dai on 2015-11-16.
//  Copyright © 2015 Yung Dai. All rights reserved.
//

import UIKit

@objc class SecondTableViewCell: UITableViewCell {


    @IBOutlet weak var secondTableViewCellLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // create the labels
        secondTableViewCellLabel.accessibilityLabel = "\(secondTableViewCellLabel.text) label"
        
        // create the hint for the cell labels
        secondTableViewCellLabel.accessibilityHint = "\(secondTableViewCellLabel.text) hint"
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
