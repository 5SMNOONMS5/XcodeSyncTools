//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit

final class ___FILEBASENAMEASIDENTIFIER___: UITableViewCell {

    @IBOutlet weak var lblContent: UILabel!

    var gradient: CAGradientLayer = {
        let _gradient: CAGradientLayer = CAGradientLayer()
        
        let colors = [UIColor(red:0.13, green:0.60, blue:0.59, alpha:0.0).cgColor,
                      UIColor(red:0.13, green:0.60, blue:0.59, alpha:0.4).cgColor,
                      UIColor(red:0.13, green:0.60, blue:0.59, alpha:0.0).cgColor]
        _gradient.colors = colors
        _gradient.locations = [0.0, 0.5, 1.0]
        _gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        _gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        _gradient.opacity = 1
        
        return _gradient
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        
        let isContains = self.layer.sublayers?.contains(self.gradient) ?? false
        
        if selected && !isContains {
            gradient.frame = self.bounds
            self.layer.addSublayer(gradient)
        } else if !selected && isContains {
            self.gradient.removeFromSuperlayer()
        }
    }

    fileprivate func setup() {
        self.selectionStyle = .none
    }
}
