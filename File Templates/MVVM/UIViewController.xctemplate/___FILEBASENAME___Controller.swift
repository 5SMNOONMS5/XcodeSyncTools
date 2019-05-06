//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit

/// ___FILEBASENAMEASIDENTIFIER___
final class ___FILEBASENAMEASIDENTIFIER___: UIViewController {
    
    private let viewModel = ___VARIABLE_viewName___ViewModel()

    lazy var title: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .white
        lbl.textColor = .black
        lbl.textAlignment = .left
        return lbl
    }()

    override func loadView() {
        let v = UIView(frame: UIScreen.main.bounds)
        v.backgroundColor = .white
        self.view = v
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupEvents()
        setupBindings()
    }
}

extension ___FILEBASENAMEASIDENTIFIER___ {
 
    /// Setup views with layout
    private func setupViews() {

    }

    /// All views with events
    private func setupEvents() {

    }

    /// Bindings data with UIElements
    private func setupBindings() {
        
    }

    /// Check parameter before request
    private func prepareToMakeRequest() {
        self.makeRequest()
    }

    private func makeRequest() {
        viewModel.requestAPI{ (response) in



        }
    }



            
}


