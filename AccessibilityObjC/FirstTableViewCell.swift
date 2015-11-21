//
//  FirstTableViewCell.swift
//  AccessabilityTest
//
//  Created by Yung Dai on 2015-11-16.
//  Copyright © 2015 Yung Dai. All rights reserved.
//

import UIKit

@objc class FirstTableViewCell: UITableViewCell {

    @IBOutlet weak var firstTableViewCellLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // create the labels
        firstTableViewCellLabel.accessibilityLabel = "\(firstTableViewCellLabel.text)"
        
        // create the hint for the cell labels
        firstTableViewCellLabel.accessibilityHint = "\(firstTableViewCellLabel.text) hint"
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
