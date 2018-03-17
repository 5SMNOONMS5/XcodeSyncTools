//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit
import Foundation

final class ___FILEBASENAMEASIDENTIFIER___: UITableViewController {

    fileprivate var data = [""]
    fileprivate let reuseIdentifier = "reuseIdentifier"

    fileprivate var viewModel: ___VARIABLE_productName:identifier___ViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModel()
        self.setupTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    deinit {

    }
}

// MARK: - ___FILEBASENAMEASIDENTIFIER___ extension
extension ___FILEBASENAMEASIDENTIFIER___ {

    fileprivate func setupViewModel() -> Void {
        self.viewModel = ___VARIABLE_productName:identifier___ViewModel()
        guard let viewModel = self.viewModel else { return }
        
        viewModel.start { [unowned self] status in
            switch status {
            case .unKnow:
                SCPrint(msg: "status unKnow", type: .negative)
            case .startLoading:
                SCPrint(msg: "status Loading")
            case .failed:
                SCPrint(msg: "loading failed", type: .negative)
            case .completed:
                SCPrint(msg: "status noNetwork, imeout or fail", type: .highLight)
            }
        }
    }

    fileprivate func setupTableView() -> Void {
        self.tableView.register(UINib(nibName: "___VARIABLE_productName:identifier___TableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
}
 
// MARK: - UITableViewDelegate
extension ___FILEBASENAMEASIDENTIFIER___ {
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

// MARK: - UITableViewDataSource
extension ___FILEBASENAMEASIDENTIFIER___ {

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? ___VARIABLE_productName:identifier___TableViewCell else {
            fatalError("Cell not exists")
        }
        let index = indexPath.row
        if let _viewModel = self.viewModel {
            cell.lbl.bindingWith ~~> _viewModel.responseText
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}
