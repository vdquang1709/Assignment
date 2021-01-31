//
//  MenuCell.swift
//  Assignment
//
//  Created by Vũ Duy Quang on 1/31/21.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var content: UILabel!
    
    public static let identifier = "MenuCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configure(image: String, text: String) {
        self.icon.image = UIImage(named: image)
        self.content.text = text
    }
    
    
    public static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
