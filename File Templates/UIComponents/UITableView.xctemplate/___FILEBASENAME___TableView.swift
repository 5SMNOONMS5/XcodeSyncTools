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
    
    private var contents: [String] = {
        var _contents: [String] = Array(repeating: "asdasdasdasdasdasdasdasdasd", count: 20)
        /// <# Notice #> For testing dynamic cell height, replace your own data
        _contents += Array(repeating: "我愛一條材我愛一條材我愛一條材我愛一條材我愛一條材我愛一條材我愛一條材", count: 5)
        _contents += Array(repeating: "HolaHolaHolaHolaHolaHolaHolaHolaHolaHolaHolaHolaHolaHola", count: 5)
        _contents += Array(repeating: "여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요", count: 5)
        return _contents
    }()

    private var rowDefaultSelected: Int = 0

    private let identifier: String = "Identifier"

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(contents: [String]) {
        self.init(frame: .zero, style: .plain)
        self.contents = contents
        self.setup()
    }
    
    private func setup() {
        self.register(___FILEBASENAMEASIDENTIFIER___Cell.self, forCellReuseIdentifier: identifier)

        super.delegate = self
        super.dataSource = self
        self.separatorStyle = .none
        self.backgroundColor = .clear
        self.estimatedRowHeight = 44.0
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.rowHeight = UITableView.automaticDimension
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
    
// <# Important #> uncomment below code will effect  <# self.rowHeight #> and <# estimatedRowHeight #>
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 44.0
//    }
    
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
        cell.lblContent.text = self.contents[indexPath.row]
        return cell
    }
}
