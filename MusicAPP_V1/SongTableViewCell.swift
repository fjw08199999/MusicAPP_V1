//
//  SongTableViewCell.swift
//  MusicAPP_V1
//
//  Created by fred fu on 2021/11/8.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    @IBOutlet weak var smallPhotoImageOutlet: UIImageView!
    @IBOutlet weak var nameLabelOutlet: UILabel!
    @IBOutlet weak var dataLabelOutlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
