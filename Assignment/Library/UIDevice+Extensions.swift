//
//  UIDevice+Extensions.swift
//  Assignment
//
//  Created by Vũ Duy Quang on 2/26/21.
//

import UIKit

extension UIDevice {
    var hasNotch: Bool {
        if #available(iOS 11.0, *) {
            if UIApplication.shared.windows.count == 0 { return false }          // Should never occur, but…
            let top = UIApplication.shared.windows[0].safeAreaInsets.top
            return top > 20          // That seem to be the minimum top when no notch…
        } else {
            // Fallback on earlier versions
            return false
        }
    }
}
