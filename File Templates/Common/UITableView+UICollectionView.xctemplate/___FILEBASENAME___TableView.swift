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
    
    private var contents: [[___VARIABLE_viewName___Model]] = []

    private let identifier: String = "Identifier"

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init(frame: CGRect, contents: [[___VARIABLE_viewName___Model]]) {
        self.init(frame: frame, style: .plain)
        self.contents = contents
        self.setup()
    }
    
    private func setup() {

        self.register(___FILEBASENAMEASIDENTIFIER___Cell.self, forCellReuseIdentifier: identifier)

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
// MARK: - UITableViewDataSource & UITableViewDelegate
//
// ******************************************
extension ___FILEBASENAMEASIDENTIFIER___: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {

    }
    
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
