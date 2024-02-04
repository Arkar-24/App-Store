//
//  AppTableViewCell.swift
//  App Store
//
//  Created by Arkar on 04/02/2024.
//

import UIKit

class AppTableViewCell: UITableViewCell {
    
    @IBOutlet weak var appImage : UIImageView!
    @IBOutlet weak var appNameLabel : UILabel!
    @IBOutlet weak var appCompamyLabel : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
