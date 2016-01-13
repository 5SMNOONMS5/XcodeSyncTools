
import UIKit

class CustomUITableViewCell : UITableViewCell{
  
}

class VC : UIViewController {
  
  let reuseCustomId = "customCell"
  let reuseId = "id"
  
  let myTableView = UITableView()
    
  override func viewDidLoad() {
    
    super.viewDidLoad()
    myTableView.delegate = self
    myTableView.dataSource = self
    myTableView.registerClass(CustomUITableViewCell.self, forCellReuseIdentifier: reuseId)

  }
}

// MARK: - UITableViewDelegate
extension VC:UITableViewDelegate{
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 90
  }
}

// MARK: - UITableViewDataSource
extension VC : UITableViewDataSource{
  
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      
      let cell = myTableView.dequeueReusableCellWithIdentifier(reuseId, forIndexPath: indexPath) as! CustomUITableViewCell
      
      /**
      if cell == nil {
        let nib = NSBundle.mainBundle().loadNibNamed(reuseCustomId, owner: self, options: nil) as NSArray
        cell = nib.objectAtIndex(0) as? UITableViewCell
      }
      */
      
      cell.selectionStyle = UITableViewCellSelectionStyle.None
      
      return cell
    }
}

