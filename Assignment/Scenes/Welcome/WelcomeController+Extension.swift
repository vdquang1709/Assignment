//
//  WelcomeController+Extension.swift
//  Assignment
//
//  Created by Vũ Duy Quang on 1/31/21.
//

import UIKit

extension WelcomeController {
    internal func setup() {
        self.usernameTextField.delegate = self
        setupContinueBtn()
        setupUsernameTextField()
        setupBackground()
    }
    
    internal func setupContinueBtn() {
        continueBtn.layer.cornerRadius = 16.0
        continueBtn.layer.shadowColor = Colors.continueBtnShadowColor.cgColor
        continueBtn.layer.shadowOffset = CGSize(width: 0.0, height: 10.0)
        continueBtn.layer.shadowRadius = 20.0
        continueBtn.layer.shadowOpacity = 1.0
        continueBtn.layer.masksToBounds = false
    }
    
    internal func setupUsernameTextField() {
        usernameTextField.layer.borderWidth = 1.0
        usernameTextField.layer.borderColor = Colors.usernameTextFieldBorderCorlor.cgColor
        usernameTextField.layer.cornerRadius = 16.0
        usernameTextField.layer.backgroundColor = Colors.usernameTextFieldBackgroundCorlor.cgColor
        
        usernameTextField.returnKeyType = .done
        
        usernameTextField.attributedPlaceholder = NSAttributedString(string: "Instagram Username", attributes: [NSAttributedString.Key.foregroundColor: Colors.usernamePlaceholder])
    }
    
    internal func setupBackground() {
        let mosaicLayout = MosaicLayout()
        
        mosaicLayout.delegate = self
        
        self.imageGridCollectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: mosaicLayout)
        
        self.view.insertSubview(imageGridCollectionView, at: 0)
        
        
        self.imageGridCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.imageGridCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.imageGridCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.imageGridCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.imageGridCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        self.gridImageData = GridImageData.fetchData(size: self.dataSize)
        
        self.imageGridCollectionView.isScrollEnabled = false
//        self.imageGridCollectionView.delegate = self
        self.imageGridCollectionView.dataSource = self
        self.imageGridCollectionView.register(GridImageCell.nib(), forCellWithReuseIdentifier: GridImageCell.identifier)
        
    }
}
