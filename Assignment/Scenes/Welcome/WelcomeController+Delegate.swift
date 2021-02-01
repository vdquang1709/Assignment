//
//  WelcomeController+Delegate.swift
//  Assignment
//
//  Created by Vũ Duy Quang on 1/31/21.
//

import UIKit

extension WelcomeController : MosaicLayoutDelegate {
    func renderType() -> RenderType {
        return .type0
    }
    
    
}

extension WelcomeController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
    }
}
