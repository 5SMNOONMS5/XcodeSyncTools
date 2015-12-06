import UIKit

class VotingProject2 : UIViewController {
    
}

class VotingProject2Cell : UITableViewCell{
    let groupImg = UIImageView()
    let name = UILabel()
}

extension VotingProject2:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90
    }
    
    //Custom cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 1{
            var cell = tableView.dequeueReusableCellWithIdentifier("CustomCell") as? VotingProject2Cell
            
            if cell == nil {
                let nib = NSBundle.mainBundle().loadNibNamed("VotingProject2Cell", owner: self, options: nil) as NSArray
                cell = nib.objectAtIndex(0) as? VotingProject2Cell
            }
            
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            
            switch indexPath.row%3 {
            case 0:
                cell?.groupImg.image = UIImage(named: "partylogo_01")
                cell?.name.text = "1號候選人：林志傑"
            case 1:
                cell?.groupImg.image = UIImage(named: "partylogo_02")
                cell?.name.text = "2號候選人：戴維斯"
            case 2:
                cell?.groupImg.image = UIImage(named: "partylogo_03")
                cell?.name.text = "3號候選人：洪志善"
            default:
                print("have problem")
            }
            return cell!
        }else{
            //Default cell
            
            var cell = tableView.dequeueReusableCellWithIdentifier("Cell")
            if cell == nil {
                cell = UITableViewCell(style: .Default ,reuseIdentifier: "Cell")
            }
            cell?.textLabel?.text = "\(indexPath.row)"
            return cell!
        }
    }
    
}
