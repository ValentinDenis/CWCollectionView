//
//  CWCollectionView.swift
//  CWCollectionView
//
//  Created by Valentin Denis on 12/07/2018.
//  Copyright © 2018 Cwep. All rights reserved.
//

import Foundation
import UIKit

/// Delegate protocol for the collection view
protocol CWCollectionViewDelegate : UICollectionViewDataSource {
    /// Number of items per row, or columns, for the table view. Default to 1
    func numberOfCulumns() -> Int
    /// Ratio of height compared to auto-calculated width according to number of columns. Exemple : 2 columns giving an appropriate width of an item at 200 , if itemHeightRatio = 0.5, height will be 100. Default to 1, making the item a square
    func itemHeightRatio() -> CGFloat
    /// Insets of section. Default to 8 for every side
    func sectionInsets() -> UIEdgeInsets
    /// The minimum value for the margin of an item. Default to 8
    func itemMinimumMargin() -> CGFloat
    /// Height for header in section. Default to CGSize.zero
    func headerHeight() -> CGSize
    
}


final class CWCollectionView : UICollectionView {
    var cwDelegate: CWCollectionViewDelegate? {
        didSet {
            self.delegate = self
            self.dataSource = cwDelegate
        }
    }
    
    //Swizzling implementations of sizeForItemAt & insetForSectionAt for those of this little lib :)
    override var delegate: UICollectionViewDelegate? {
        didSet {
            if let delegate = delegate {
                if delegate is UICollectionViewDelegateFlowLayout {
                    let originalMethodSize = class_getInstanceMethod(object_getClass(cwDelegate!), #selector(collectionView(_:layout:sizeForItemAt:)))
                    let swizzledMethodSize = class_getInstanceMethod(object_getClass(self), #selector(collectionView(_:layout:sizeForItemAt:)))
                    let originalMethodInset = class_getInstanceMethod(object_getClass(cwDelegate!), #selector(collectionView(_:layout:insetForSectionAt:)))
                    let swizzledMethodInset = class_getInstanceMethod(object_getClass(self), #selector(collectionView(_:layout:insetForSectionAt:)))
                    if let originalMethod = originalMethodSize, let swizzledMethod = swizzledMethodSize {
                        method_exchangeImplementations(originalMethod, swizzledMethod)
                    }
                    if let originalMethodInset = originalMethodInset, let swizzledMethodInset = swizzledMethodInset {
                        method_exchangeImplementations(originalMethodInset, swizzledMethodInset)
                    }
                }
            }
        }
    }
}

extension CWCollectionView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //Default values
        var width : CGFloat = 50
        var height : CGFloat = 50
        
        //Split because apparently "too complex" for swift precompil
        width = collectionView.bounds.size.width / (CGFloat(cwDelegate?.numberOfCulumns() ?? 1))
        width = width - ((cwDelegate?.itemMinimumMargin() ?? 8.0) + (cwDelegate?.sectionInsets().left ?? 8.0))
        height = width * (cwDelegate?.itemHeightRatio() ?? 1.0)
        
        return CGSize.init(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return cwDelegate?.sectionInsets() ?? UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return cwDelegate?.headerHeight() ?? CGSize.zero
    }
}
