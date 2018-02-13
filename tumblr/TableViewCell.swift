//
//  TableViewCell.swift
//  tumblr
//
//  Created by ARG Lab on 1/31/18.
//  Copyright © 2018 ARG Lab. All rights reserved.
//

import UIKit


class TumCell: UITableViewCell {
    
    @IBOutlet weak var cover: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

}
