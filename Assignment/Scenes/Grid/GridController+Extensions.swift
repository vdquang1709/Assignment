//
//  GridController+Extensions.swift
//  Assignment
//
//  Created by Vũ Duy Quang on 1/28/21.
//

import UIKit

extension GridController {
    internal func setup() {
        setupControls()
        setupStatisticView()
        setupImageGrid()
        setupTagLine()
    }
    
    internal func setupTagLine() {
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: Fonts.tagLineFirstHalf, size: 14.0), NSAttributedString.Key.foregroundColor : Colors.tagLineFirstHalf]
        
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: Fonts.tagLineSecondHalf, size: 14.0), NSAttributedString.Key.foregroundColor : Colors.tagLineSecondHalf]
        
        let attributedString1 = NSMutableAttributedString(string:"You received ", attributes:attrs1 as [NSAttributedString.Key : Any])
        
        let attributedString2 = NSMutableAttributedString(string:"77 likies in 2019", attributes:attrs2 as [NSAttributedString.Key : Any])
        
        attributedString1.append(attributedString2)
        self.tagLine.attributedText = attributedString1
    }
    
    internal func setupImageGrid() {
        
        gradientView = UIView()
        
        let colorTop =  Colors.gridGradientStart.cgColor
        let colorBottom = Colors.gridGradientEnd.cgColor
        
        gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        
        gradientView.layer.addSublayer(gradientLayer)
        
        self.gridContainer.insertSubview(gradientView, at: 0)
        
        let mosaicLayout = MosaicLayout()
        
        mosaicLayout.delegate = self
        
        self.imageGridCollectionView = UICollectionView(frame: self.gridContainer.bounds, collectionViewLayout: mosaicLayout)
        
        self.gridContainer.insertSubview(imageGridCollectionView, at: 0)
        
        self.imageGridCollectionView.backgroundColor = Colors.imageGridBackground
        
        self.imageGridCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.imageGridCollectionView.topAnchor.constraint(equalTo: self.gridContainer.topAnchor).isActive = true
        self.imageGridCollectionView.bottomAnchor.constraint(equalTo: self.gridContainer.bottomAnchor).isActive = true
        self.imageGridCollectionView.leadingAnchor.constraint(equalTo: self.gridContainer.leadingAnchor).isActive = true
        self.imageGridCollectionView.trailingAnchor.constraint(equalTo: self.gridContainer.trailingAnchor).isActive = true
        
        self.imageGridCollectionView.isScrollEnabled = false
        
        self.gridImageData = GridImageData.fetchData(size: self.dataSize)
        self.imageGridCollectionView.delegate = self
        self.imageGridCollectionView.dataSource = self
        self.imageGridCollectionView.register(GridImageCell.nib(), forCellWithReuseIdentifier: GridImageCell.identifier)
    }
    
    internal func setupStatisticView() {
        self.statisticView.layer.borderWidth = 0.5
        self.statisticView.layer.borderColor = Colors.statisticViewBorder.cgColor
    }
    
    internal func setupControls() {
        self.controlsCollectionView.delegate = self
        self.controlsCollectionView.dataSource = self
        self.controlsCollectionView.register(ControlCell.nib(), forCellWithReuseIdentifier: ControlCell.identifier)
        self.controlsCollectionView.register(ControlSpacingCell.self, forCellWithReuseIdentifier: ControlSpacingCell.identifier)
    }
    
}
