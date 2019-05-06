//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit

/// ___FILEBASENAMEASIDENTIFIER___
final class ___FILEBASENAMEASIDENTIFIER___: UITableViewCell {

    public var content: [___VARIABLE_viewName___Model]?

    public var onClick: ((_ model: ___VARIABLE_viewName___Model) -> ())?

    private let identifier = "CollectionViewCellIdentifier"

    @IBOutlet weak var cv: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
        self.setupCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    /// Setup TableViewCell self
    private func setup() {
        self.selectionStyle = .none
    }

    /// Setup CollectionView self
    private func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 100, height: 140)
        flowLayout.minimumLineSpacing = 2.0
        flowLayout.minimumInteritemSpacing = 5.0
        cv.collectionViewLayout = flowLayout
        
        let nib = UINib(nibName: "___VARIABLE_viewName___CollectionViewCell", bundle: nil)
        cv.register(nib, forCellWithReuseIdentifier: identifier)
    }

    public func update(content: [___VARIABLE_viewName___Model]) {
        self.content = content
        cv.delegate = self
        cv.dataSource = self
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
        onClick?(self.content![indexPath.row])
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
        return self.content?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath as IndexPath) as! ___VARIABLE_viewName___CollectionViewCell
        cell.setContent(data: self.content![indexPath.row])
        return cell
    }
}
