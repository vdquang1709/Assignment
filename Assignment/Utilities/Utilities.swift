/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Utility functions for helping display the user interface.
*/

import UIKit

extension CGRect {
    func dividedIntegral(fraction: CGFloat, from fromEdge: CGRectEdge) -> (first: CGRect, second: CGRect) {
        let dimension: CGFloat
        
        switch fromEdge {
        case .minXEdge, .maxXEdge:
            dimension = self.size.width
        case .minYEdge, .maxYEdge:
            dimension = self.size.height
        }
        
        let distance = (dimension * fraction).rounded(.up)
        let slices = self.divided(atDistance: distance, from: fromEdge)
        
        return (first: slices.slice, second: slices.remainder)
    }
}
