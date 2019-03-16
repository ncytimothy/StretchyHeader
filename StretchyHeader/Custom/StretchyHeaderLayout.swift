//
//  StretchyHeaderLayout.swift
//  StretchyHeader
//
//  Created by Tim Ng on 3/16/19.
//  Copyright © 2019 Tim Ng. All rights reserved.
//

import UIKit

class StretchyHeaderLayout: UICollectionViewFlowLayout {

    // want to modify the attributes of header component
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        layoutAttributes?.forEach({ (layoutAttributes) in
            if layoutAttributes.representedElementKind == UICollectionView.elementKindSectionHeader && layoutAttributes.indexPath.section == 0 {
                
                // layoutAttributes.indexPath.section to handle multiple headers
                
                guard let collectionView = collectionView else { return }
                
                if collectionView.contentOffset.y > 0 {
                    return
                }
                
                let contentOffsetY = collectionView.contentOffset.y
                let width = collectionView.frame.width
                
                let height = layoutAttributes.frame.height - contentOffsetY
                
                // here is the header code
                layoutAttributes.frame = CGRect(x: 0, y: contentOffsetY, width: width, height: height)
            }
        })
        return layoutAttributes
        
    }
    
    // Invalidate the layout so that the layout recalculates as the collectionView
    // bounds change
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
