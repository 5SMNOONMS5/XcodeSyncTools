//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit
import SnapKit
import JTAppleCalendar

/// ___FILEBASENAMEASIDENTIFIER___
final class ___FILEBASENAMEASIDENTIFIER___: JTAppleCell {
    
    let context: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14.0)
        lbl.textColor = .black
        lbl.text = "Text Text Text Text Text"
        lbl.textAlignment = .center
        return lbl
    }()
    
    let selectedView: UIView = {
        let v = UIView()
        v.backgroundColor = .red
        return v
    }()
    
    /// Cell view that will be customized
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Prepares the receiver for service after it has been loaded from an Interface Builder archive, or nib file.
    public override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    /// Setup TableViewCell it self
    private func setup() {

        contentView.addSubview(context)
        context.translatesAutoresizingMaskIntoConstraints = false
        
        context.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        context.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        context.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        context.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        contentView.addSubview(selectedView)
        selectedView.translatesAutoresizingMaskIntoConstraints = false
        
        selectedView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        selectedView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        selectedView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        selectedView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
}





