//
//  DataCell.swift
//  cleancode-lazyloading-webImage
//
//  Created by Sarath P on 31/12/22.
//

import UIKit

class DataCell: UITableViewCell {
    
    @IBOutlet weak var thumbImgView: LazyImageView!
    @IBOutlet weak var lblName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
