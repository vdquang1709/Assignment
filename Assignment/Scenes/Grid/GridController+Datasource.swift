//
//  GridController+Datasource.swift
//  Assignment
//
//  Created by Vũ Duy Quang on 1/28/21.
//

import UIKit

extension GridController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.controlsCollectionView == collectionView {
            return self.controlBtnList.count * 2 + 1
        }
        if self.imageGridCollectionView == collectionView {
            return self.gridImageData.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if self.controlsCollectionView == collectionView {
            let row = indexPath.row
            
            if row % 2 != 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ControlCell.identifier, for: indexPath) as! ControlCell
                
                let index = row / 2
                if index < self.controlBtnList.count {
                    let datum = self.controlBtnList[index]
                    if let text = datum.text, let image = datum.image {
                        var finalImage = image
                        
                        if index == 0 {
                            finalImage = self.gridBtnImage
                        }
                        cell.configure(image: finalImage, text: text)
                    }
                }

                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ControlSpacingCell.identifier, for: indexPath) as! ControlSpacingCell
                return cell
            }
        }
        if self.imageGridCollectionView == collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridImageCell.identifier, for: indexPath) as! GridImageCell
            
            let index = indexPath.row
            if index < self.gridImageData.count {
                let image = self.gridImageData[index]
                cell.configure(image: image)
                
            }
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    
}


