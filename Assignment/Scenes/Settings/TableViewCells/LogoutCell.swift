//
//  LogoutCell.swift
//  Assignment
//
//  Created by Vũ Duy Quang on 1/31/21.
//

import UIKit

class LogoutCell: UITableViewCell {
    @IBOutlet weak var button: UIButton!
    
    public static let identifier = "LogoutCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setup() {
        self.button.layer.cornerRadius = 16
    }
    
    public static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
