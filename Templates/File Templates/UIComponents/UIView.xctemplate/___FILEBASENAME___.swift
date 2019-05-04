//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//
import UIKit

// ___FILEBASENAMEASIDENTIFIER___ View
final class ___FILEBASENAMEASIDENTIFIER___: UIView {
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupUI()
    }
    
    convenience init () {
        self.init(frame: .zero)
        self.setupUI()
        self.setupEvents()
    }

    private func setupUI() { 

    }
    
    private func setupEvents() {
        
    }
}
