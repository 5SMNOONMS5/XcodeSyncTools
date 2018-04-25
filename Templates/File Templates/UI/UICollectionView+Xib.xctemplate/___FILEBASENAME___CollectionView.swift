//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//
import UIKit

final class ___FILEBASENAMEASIDENTIFIER___: UICollectionView {
    
    fileprivate var contents: [String] = Array(repeating: "ssssssss", count: 30)
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.setup()
    }
    
    convenience init(frame: CGRect, expandWidth: CGFloat, collapsedWidth: CGFloat) {

        let layout = ___VARIABLE_viewName___CollectionLayout()
        self.init(frame: frame, collectionViewLayout: layout)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setup() {
        
        self.register(gc_Nib(name: "___VARIABLE_viewName___CollectionViewCell"), forCellWithReuseIdentifier: ___VARIABLE_viewName___CollectionViewCell.className)
        self.backgroundColor = .blue
        
        self.decelerationRate = UIScrollViewDecelerationRateFast
        self.alwaysBounceHorizontal = true
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        
        super.delegate = self
        super.dataSource = self
    }
}

// ******************************************
//
// MARK: - UICollectionViewDelegate
//
// ******************************************
extension ___FILEBASENAMEASIDENTIFIER___: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

// ******************************************
//
// MARK: - UICollectionViewDataSource
//
// ******************************************
extension ___FILEBASENAMEASIDENTIFIER___: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.contents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ___VARIABLE_viewName___CollectionViewCell.className, for: indexPath as IndexPath) as! ___VARIABLE_viewName___CollectionViewCell
        
        return cell
    }
}


