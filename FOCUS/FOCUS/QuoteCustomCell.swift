//
//  QuoteCustomCell.swift
//  FOCUS
//
//  Created by Adrien Villez on 5/4/15.
//  Copyright (c) 2015 AdrienVillez. All rights reserved.
//

import UIKit

class QuoteCustomCell: UITableViewCell
{
    @IBOutlet weak var quoteCellLabel: UILabel!
    @IBOutlet weak var authorCellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
