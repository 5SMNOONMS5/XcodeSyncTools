
import UIKit

private let reuseIdCell : String = "reuseIdCell"
private let reuseIdHeader : String = "reuseIdHeader"


let collectionView: UICollectionView!


let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
layout.itemSize = CGSize(width: 44, height: 44)
layout.scrollDirection = .Horizontal
layout.minimumInteritemSpacing = 5.5


collectionView = UICollectionView(frame: CGRect(x: <#  float #>, y: <#  float #>, width: <#  float #>, height: <#  float #>))
collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdCell)

let nib = UINib(nibName: "name", bundle: nil)
collectionView.registerNib(nib, forCellWithReuseIdentifier: reuseIdCell)


