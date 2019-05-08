//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//
import UIKit

/// ___FILEBASENAMEASIDENTIFIER___
final class ___FILEBASENAMEASIDENTIFIER___: UICollectionView {
    
    private var contents: [String] = Array(repeating: "ssssssss", count: 30)

    private let identifier: String = "Identifier"
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    convenience init(frame: CGRect) {
        let layout = ___VARIABLE_viewName___CollectionLayout()
        self.init(frame: frame, collectionViewLayout: layout)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        self.register(UINib(nibName: "___VARIABLE_viewName___CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifier)
        self.backgroundColor = .blue
        
        self.decelerationRate = .fast
        self.alwaysBounceHorizontal = true
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        
        super.delegate = self
        super.dataSource = self
    }
}

// ******************************************
//
// MARK: - UICollectionViewDelegate & UICollectionViewDataSource
//
// ******************************************
extension ___FILEBASENAMEASIDENTIFIER___: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.contents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath as IndexPath) as! ___VARIABLE_viewName___CollectionViewCell
        
        return cell
    }
}


