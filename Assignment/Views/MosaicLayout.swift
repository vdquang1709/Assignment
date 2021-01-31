/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Custom view flow layout for mosaic-style appearance.
*/

import UIKit

enum MosaicSegmentStyle {
    case fullWidth
    case fiftyFifty
    case twoThirdsOneThird
    case oneThirdTwoThirds
}

enum RenderType {
    case type8
    case type9
    case type0
}

protocol MosaicLayoutDelegate {
    func renderType() -> RenderType
}

class MosaicLayout: UICollectionViewLayout {
    var delegate: MosaicLayoutDelegate?
    var contentBounds = CGRect.zero
    var cachedAttributes = [UICollectionViewLayoutAttributes]()
    
    /// - Tag: PrepareMosaicLayout
    override func prepare() {
        super.prepare()
        var renderType = RenderType.type9
        if let delegate = self.delegate {
            renderType = delegate.renderType()
        }
        
        guard let collectionView = collectionView else { return }

        // Reset cached information.
        cachedAttributes.removeAll()
        contentBounds = CGRect(origin: .zero, size: .zero)
        
        // For every item in the collection view:
        //  - Prepare the attributes.
        //  - Store attributes in the cachedAttributes array.
        //  - Combine contentBounds with attributes.frame.
        let count = collectionView.numberOfItems(inSection: 0)
        var currentIndex = 0
        var segment: MosaicSegmentStyle = findSegmentStyle(renderType: renderType, index: currentIndex)
        var lastFrame: CGRect = .zero
        
        let cvWidth = collectionView.frame.size.width
        let cvHeight = collectionView.frame.size.height
        
        let cvHeightUnit = ((cvWidth / 3.0) / 125.0) * 105.0
        
        let actualHeight = CGFloat(calculateActualHeight(renderType: renderType, totalElements: count, width: Float(cvHeightUnit)))
        
        if renderType != .type0, actualHeight < cvHeight {
            lastFrame = CGRect(origin: CGPoint(x: 0, y: cvHeight - actualHeight), size: .zero)
        }
        
        while currentIndex < count {
            var segmentFrame = CGRect(x: 0, y: lastFrame.maxY, width: cvWidth, height: cvHeightUnit)
            
            var segmentRects = [CGRect]()
            switch segment {
            case .fullWidth:
                let horizontalSlices = segmentFrame.dividedIntegral(fraction: 1.0/3.0, from: .minXEdge)
                let lastHalfs = horizontalSlices.second.dividedIntegral(fraction: 0.5, from: .minXEdge)
                segmentRects = [horizontalSlices.first, lastHalfs.first, lastHalfs.second]
                
            case .fiftyFifty:
                segmentFrame = CGRect(x: 0, y: lastFrame.maxY, width: cvWidth, height: cvHeightUnit * 2.0)
                let horizontalSlices = segmentFrame.dividedIntegral(fraction: 0.5, from: .minXEdge)
                segmentRects = [horizontalSlices.first, horizontalSlices.second]
                
            case .twoThirdsOneThird:
                segmentFrame = CGRect(x: 0, y: lastFrame.maxY, width: cvWidth, height: cvHeightUnit * 2.0)
                let horizontalSlices = segmentFrame.dividedIntegral(fraction: (2.0 / 3.0), from: .minXEdge)
                let verticalSlices = horizontalSlices.second.dividedIntegral(fraction: 0.5, from: .minYEdge)
                segmentRects = [horizontalSlices.first, verticalSlices.first, verticalSlices.second]
                
            case .oneThirdTwoThirds:
                segmentFrame = CGRect(x: 0, y: lastFrame.maxY, width: cvWidth, height: cvHeightUnit * 2.0)
                let horizontalSlices = segmentFrame.dividedIntegral(fraction: (1.0 / 3.0), from: .minXEdge)
                let verticalSlices = horizontalSlices.first.dividedIntegral(fraction: 0.5, from: .minYEdge)
                segmentRects = [verticalSlices.first, verticalSlices.second, horizontalSlices.second]
            }
            
            // Create and cache layout attributes for calculated frames.
            for rect in segmentRects {
                let attributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: currentIndex, section: 0))
                attributes.frame = rect
                
                cachedAttributes.append(attributes)
                contentBounds = contentBounds.union(lastFrame)
                
                currentIndex += 1
                lastFrame = rect
            }

            segment = findSegmentStyle(renderType: renderType, index: currentIndex)
        }
    }
    
    private func findSegmentStyle(renderType: RenderType, index currentIndex: Int) -> MosaicSegmentStyle{
        
        var segment: MosaicSegmentStyle = .fullWidth
        switch renderType {
        case .type8:
            let realIndex = currentIndex % 8
            if realIndex == 0 {
                segment = .fiftyFifty
            } else {
                segment = .fullWidth
            }
            return segment
        case .type9:
            let realIndex = currentIndex % 9
            if realIndex == 0 {
                segment = .twoThirdsOneThird
            } else {
                segment = .fullWidth
            }
            return segment
        case .type0:
            let realIndex = currentIndex % 6
            if realIndex == 0 {
                segment = .twoThirdsOneThird
            } else {
                segment = .oneThirdTwoThirds
            }
            return segment
        }
    }
    
    private func calculateActualHeight(renderType: RenderType, totalElements count: Int, width cvUnitWidth: Float) -> Float {
        let sectionHeight = cvUnitWidth * 4
        
        switch renderType {
        case .type8:
            let secs = count / 8
            var actualHeight = sectionHeight * Float(secs)
            
            let remainder = count % 8
            if remainder > 5 {
                actualHeight += sectionHeight
            } else if remainder > 2 {
                actualHeight += 3 * cvUnitWidth
            } else if remainder > 0 {
                actualHeight += 2 * cvUnitWidth
            }
            return actualHeight
        case .type9:
            let secs = count / 9
            var actualHeight = sectionHeight * Float(secs)
            
            let remainder = count % 9
            if remainder > 6 {
                actualHeight += sectionHeight
            } else if remainder > 3 {
                actualHeight += 3 * cvUnitWidth
            } else if remainder > 0 {
                actualHeight += 2 * cvUnitWidth
            }
            return actualHeight
        case .type0:
            return 3 * sectionHeight
        }
    }
    
    /// - Tag: CollectionViewContentSize
    override var collectionViewContentSize: CGSize {
        return contentBounds.size
    }
    
    /// - Tag: ShouldInvalidateLayout
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        guard let collectionView = collectionView else { return false }
        return !newBounds.size.equalTo(collectionView.bounds.size)
    }
    
    /// - Tag: LayoutAttributesForItem
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cachedAttributes[indexPath.item]
    }
    
    /// - Tag: LayoutAttributesForElements
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributesArray = [UICollectionViewLayoutAttributes]()
        
        // Find any cell that sits within the query rect.
        guard let lastIndex = cachedAttributes.indices.last,
              let firstMatchIndex = binSearch(rect, start: 0, end: lastIndex) else { return attributesArray }
        
        // Starting from the match, loop up and down through the array until all the attributes
        // have been added within the query rect.
        for attributes in cachedAttributes[..<firstMatchIndex].reversed() {
            guard attributes.frame.maxY >= rect.minY else { break }
            attributesArray.append(attributes)
        }
        
        for attributes in cachedAttributes[firstMatchIndex...] {
            guard attributes.frame.minY <= rect.maxY else { break }
            attributesArray.append(attributes)
        }
        
        return attributesArray
    }
    
    // Perform a binary search on the cached attributes array.
    func binSearch(_ rect: CGRect, start: Int, end: Int) -> Int? {
        if end < start { return nil }
        
        let mid = (start + end) / 2
        let attr = cachedAttributes[mid]
        
        if attr.frame.intersects(rect) {
            return mid
        } else {
            if attr.frame.maxY < rect.minY {
                return binSearch(rect, start: (mid + 1), end: end)
            } else {
                return binSearch(rect, start: start, end: (mid - 1))
            }
        }
    }

}
