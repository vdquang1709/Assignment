//
//  GridImageCell.swift
//  Assignment
//
//  Created by Vũ Duy Quang on 1/28/21.
//

import UIKit

class GridImageCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    
    public static let identifier = "GridImageCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    public func configure(image: String) {
        self.image.image = UIImage(named: image)
    }
}
