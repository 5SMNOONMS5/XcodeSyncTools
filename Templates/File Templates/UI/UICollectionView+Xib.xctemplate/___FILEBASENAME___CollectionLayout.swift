//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit

final class ___FILEBASENAMEASIDENTIFIER___: UICollectionViewLayout {
    
    public override init() {
        super.init()
        print("SSSSCollectionLayout")
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate var cached = [UICollectionViewLayoutAttributes]()
    
    // <# First step #>
    // Return the size of all the content in the collection view
    override var collectionViewContentSize: CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    // <# Second Step #>
    // Perform whatever calculations are needed to determine the position of the cells and views in the layout
    override func prepare() {
        print("prepare ")
    }
    
    // <# Third Step #>
    //
    // Tip
    // Need to override layoutAttributesForElements(in:), which the collection view calls after prepare() to determine which items are visible in the given rect.
    //
    // Return all attributes in the cache whose frame intersects with the rect passed to the method
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cached.filter { attributes in
            return attributes.frame.intersects(rect)
        }
    }
    
    // <# Fouth Step #>
    // Returns the layout attributes for the item at the specified index path.
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cached[indexPath.item]
    }
}

