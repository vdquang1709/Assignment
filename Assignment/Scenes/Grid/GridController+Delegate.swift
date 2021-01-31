//
//  GridController+Delegate.swift
//  Assignment
//
//  Created by Vũ Duy Quang on 1/28/21.
//

import UIKit

extension GridController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.controlsCollectionView == collectionView {
            let row = indexPath.row
            if row % 2 != 0 {
                let index = row / 2
                let datum = self.controlBtnList[index]
                
                if let text = datum.text {
                    if text == "GRID" {
                        self.changeRenderType()
                    }
                    
                    print("Click ", text)
                }
            }
        }
    }
}

extension GridController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if self.controlsCollectionView == collectionView {
            let row = indexPath.row

            if row % 2 != 0 {
                return CGSize(width: 68, height: 94)
            } else {
                if row == 0 || row == self.controlBtnList.count * 2{
                    return CGSize(width: 20, height: 94)
                }
                return CGSize(width: 16, height: 94)
            }
        }
        return CGSize(width: 0, height: 0)
    }
}

extension GridController : MosaicLayoutDelegate {
    func renderType() -> RenderType {
        return self.gridRenderType
    }
}
