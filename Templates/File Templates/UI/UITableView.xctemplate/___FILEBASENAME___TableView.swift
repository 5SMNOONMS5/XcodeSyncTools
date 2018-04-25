//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit

// <# Important #>
// If you have your own extension, kindly delete me :(
public extension NSObject {
    
    /// Get class name
    ///
    /// EX:
    ///
    /// ```swift
    /// MyClass.className   //=> "MyClass"
    /// ```
    class var className: String {
        return String(describing: self)
    }
}

final class ___FILEBASENAMEASIDENTIFIER___: UITableView {
    
    fileprivate var contents: [String] = {
        var _contents: [String] = Array(repeating: "asdasdasdasdasdasdasdasdasd", count: 20)
        /// <# Notice #> For testing dynamic cell height, replace your own data
        _contents += Array(repeating: "我愛一條材我愛一條材我愛一條材我愛一條材我愛一條材我愛一條材我愛一條材", count: 5)
        _contents += Array(repeating: "HolaHolaHolaHolaHolaHolaHolaHolaHolaHolaHolaHolaHolaHola", count: 5)
        _contents += Array(repeating: "여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요여보세요", count: 5)
        return _contents
    }()

    fileprivate var rowDefaultSelected: Int = 0

    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    convenience init(contents: [String]) {
        self.init(frame: .zero, style: .plain)
        self.contents = contents
    }
    
    fileprivate func setup() {
        self.register(UINib(nibName: "___FILEBASENAMEASIDENTIFIER___Cell", bundle: nil), forCellReuseIdentifier: ___FILEBASENAMEASIDENTIFIER___Cell.className)
        
//      <# Important #> If you don't want use xib, remove xib first then uncommment below code
//        self.register(___FILEBASENAMEASIDENTIFIER___Cell.self, forCellReuseIdentifier: ___FILEBASENAMEASIDENTIFIER___Cell.className)

        super.delegate = self
        super.dataSource = self
        self.separatorStyle = .none
        self.backgroundColor = .clear
        self.estimatedRowHeight = 44.0
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.rowHeight = UITableViewAutomaticDimension
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ___FILEBASENAMEASIDENTIFIER___Cell.className, for: indexPath) as! ___FILEBASENAMEASIDENTIFIER___Cell
        cell.lblContent.text = self.contents[indexPath.row]
        return cell
    }
}
