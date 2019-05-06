//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit

/// ___FILEBASENAMEASIDENTIFIER___
final class ___FILEBASENAMEASIDENTIFIER___: UITableView {
    
    fileprivate var contents: [[___VARIABLE_viewName___Model]] = {
        var model = ___VARIABLE_viewName___Model(title: "Test Collection View")
        var _contents: [___VARIABLE_viewName___Model] = Array(repeating: model, count: 5)
        return Array(repeating: _contents, count: 5)
    }()

    fileprivate var rowDefaultSelected: Int = 0

    fileprivate let identifier: String = "Identifier"

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    convenience init(contents: [[___VARIABLE_viewName___Model]]) {
        self.init(frame: .zero, style: .plain)
        self.contents = contents
    }
    
    fileprivate func setup() {
        self.register(UINib(nibName: "___FILEBASENAMEASIDENTIFIER___Cell", bundle: nil), forCellReuseIdentifier: identifier)

        super.delegate = self
        super.dataSource = self
        self.separatorStyle = .none
        self.backgroundColor = .clear
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        // self.estimatedRowHeight = 44.0
        // self.rowHeight = UITableView.automaticDimension
    }
}

// ******************************************
//
// MARK: - UITableViewDelegate
//
// ******************************************
extension ___FILEBASENAMEASIDENTIFIER___: UITableViewDelegate {

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == rowDefaultSelected {
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
            /// meaning already selected, then don't need extra flag to detect
            rowDefaultSelected = -1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {

    }
}

// ******************************************
//
// MARK: - UITableViewDataSource
//
// ******************************************
extension ___FILEBASENAMEASIDENTIFIER___: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ___FILEBASENAMEASIDENTIFIER___Cell
        cell.update(content: self.contents[indexPath.row])
        cell.onClick = { _ in
            
        }
        return cell
    }
}
