//
//  WelcomeController+DataSource.swift
//  Assignment
//
//  Created by Vũ Duy Quang on 1/31/21.
//

import UIKit

extension WelcomeController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.gridImageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridImageCell.identifier, for: indexPath) as! GridImageCell
        
        let index = indexPath.row
        if index < self.gridImageData.count {
            let image = self.gridImageData[index]
            cell.configure(image: image)
            
        }
        return cell
    }
    
    
}
