//
//  MovieCell.swift
//  TheMobieApp
//
//  Created by Rafael Santana on 3/23/19.
//  Copyright © 2019 Rafael Santana. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    @IBOutlet weak var summary: UILabel!
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var poster: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
