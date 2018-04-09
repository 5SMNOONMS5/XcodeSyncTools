//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit
import Foundation

final class ___FILEBASENAMEASIDENTIFIER___: UIViewController {

    fileprivate var viewModel: ___VARIABLE_productName:identifier___ViewModel?

    /// Test binding a value with label
    fileprivate lazy var testLabel: UILabel = {
        let _testLabel = UILabel()
        _testLabel.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
        _testLabel.numberOfLines = 0
        _testLabel.textColor = .red
        _testLabel.backgroundColor = .blue
        _testLabel.text = "Test Binding"
        _testLabel.textAlignment = .center
        return _testLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupViewModel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    deinit {

    }
}

// MARK: - ___FILEBASENAMEASIDENTIFIER___ extension
extension ___FILEBASENAMEASIDENTIFIER___ {

    fileprivate func setupUI() -> Void {
        self.view.addSubview(self.testLabel)
    }

    fileprivate func setupViewModel() -> Void {
        self.viewModel = ___VARIABLE_productName:identifier___ViewModel()
        guard let viewModel = self.viewModel else { return }
        
        self.testLabel.bindingWith ~~> viewModel.testBinging        
        viewModel.start { [unowned self] status in
            switch status {
            case .unKnow:
                SCPrint(msg: "status unKnow", type: .negative)
            case .startLoading:
                SCPrint(msg: "status Loading")
            case .failed:
                SCPrint(msg: "loading failed", type: .negative)
            case .completed:
                SCPrint(msg: "loading completed", type: .highLight)
            }
        }
    }
}
 


