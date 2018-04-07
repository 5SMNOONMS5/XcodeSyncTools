//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit

class ___FILEBASENAMEASIDENTIFIER___: UIView {

    @IBOutlet weak var viewContent: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupXib()
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupXib()
        self.setupUI()
    }
    
    convenience init () {
        self.init(frame: .zero)
    }
    
    private func setupXib() {
        Bundle.main.loadNibNamed("___FILEBASENAMEASIDENTIFIER___", owner: self, options: nil)
        self.viewContent.frame = self.bounds
        self.addSubview(self.viewContent)
    }
    
    private func setupUI() {
        
    }
}
