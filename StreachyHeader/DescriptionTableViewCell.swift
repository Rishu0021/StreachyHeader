//
//  DescriptionTableViewCell.swift
//  StreachyHeader
//
//  Created by Rishu Gupta on 01/12/20.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(_ data: String) {
        self.labelTitle.text = data
    }
    
}
