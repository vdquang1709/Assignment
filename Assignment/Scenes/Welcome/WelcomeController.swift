//
//  WelcomeController.swift
//  Assignment
//
//  Created by Vũ Duy Quang on 1/28/21.
//

import UIKit

class WelcomeController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    internal var imageGridCollectionView: UICollectionView!
    internal var dataSize = 15
    internal var gridImageData : [String] = []
    private var bottomConstraintDefaultValue : Float = 0
    
    var gradientLayer: CAGradientLayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(WelcomeController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(WelcomeController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        self.bottomConstraintDefaultValue = Float(self.bottomConstraint.constant)
        setup()
    }
    
    @IBAction func contBtnTouch(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
               // if keyboard size is not available for some reason, dont do anything
               return
            }
        
        let offset = keyboardSize.minY - self.usernameTextField.frame.maxY - 10
        
        self.bottomConstraint.constant -= offset
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        self.bottomConstraint.constant = CGFloat(self.bottomConstraintDefaultValue)
    }
}
