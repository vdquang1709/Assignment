//
//  UnlockPremiumCell.swift
//  Assignment
//
//  Created by Vũ Duy Quang on 1/31/21.
//

import UIKit

class UnlockPremiumCell: UITableViewCell {

    @IBOutlet weak var button: UIButton!
    
    public static let identifier = "UnlockPremiumCell"
    
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
        
        self.button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: Fonts.preminumTitle, size: 24.0), NSAttributedString.Key.foregroundColor : Colors.tagLineSecondHalf]
        
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: Fonts.preminumSubtitle, size: 13.0), NSAttributedString.Key.foregroundColor : Colors.tagLineSecondHalf]
        
        let attributedString1 = NSMutableAttributedString(string:"Unlock Preminum\n", attributes:attrs1 as [NSAttributedString.Key : Any])
        
        let attributedString2 = NSMutableAttributedString(string:"Remove watermark, unlock video...", attributes:attrs2 as [NSAttributedString.Key : Any])
        
        attributedString1.append(attributedString2)
        
        self.button.setAttributedTitle(attributedString1, for: .normal)
    }
    
    public static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
