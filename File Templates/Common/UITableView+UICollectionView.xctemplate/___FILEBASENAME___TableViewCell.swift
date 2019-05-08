//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit
import SnapKit

/// ___FILEBASENAMEASIDENTIFIER___
final class ___FILEBASENAMEASIDENTIFIER___: UITableViewCell {

    public var content: [___VARIABLE_viewName___Model]?

    public var onClick: ((_ model: ___VARIABLE_viewName___Model) -> ())?

    private let identifier = "identifier"

    lazy var cv: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 160.0, height: 170.0)
        flowLayout.minimumLineSpacing = 8.0
        return UICollectionView(frame:.zero, collectionViewLayout: flowLayout)
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setup()
        self.setupCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    /// Setup TableViewCell itself
    private func setup() {
        self.selectionStyle = .none
        self.contentView.backgroundColor = .white
    }

    /// Setup CollectionView self
    private func setupCollectionView() {
        self.contentView.addSubview(cv)
        cv.snp.makeConstraints { (make) in
            make.leading.bottom.trailing.top.equalToSuperview()
        }
        
        cv.backgroundColor = .white
        cv.register(___VARIABLE_viewName___CollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
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

