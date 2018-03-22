import Foundation
import UIKit
import Highlightr

let data = ["00000000000000","1"]

class CodeVC: UIViewController{
    var myIndex = 5
    var mySecondIndex = 5
    var cellCode : [Any] = []
    var cellRun : [Any] = []
    var cellDesc : [Any] = []
    
    var highlightr = Highlightr()
    let textStorage = CodeAttributedString()
    
    //@IBOutlet weak var const: NSLayoutConstraint!
    
    @IBOutlet weak var tableViewCode: UITableView!
    
    override func viewDidLoad() {
        tableViewCode.estimatedRowHeight = tableViewCode.rowHeight
        tableViewCode.estimatedRowHeight = UITableViewAutomaticDimension
        let subLessonData = DataSingleton.shared.grabSpecific(tab: "Code") as! [String : Any]
        //Parse of JSON
        print("in code vc")
        cellCode = subLessonData["CellCode"] as! [Any]
        cellRun = subLessonData["CellRun"] as! [Any]
        cellDesc = subLessonData["CellDesc"] as! [Any]
        
        //Syntax Highlighting
        textStorage.highlightr.setTheme(to: "solarized-dark")

    }
    
    
    // Controls orientation
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //AppUtility.lockOrientation(.portrait)
        // Or to rotate and lock
        AppUtility.lockOrientation(.portrait , andRotateTo: .portraitUpsideDown)
        AppUtility.lockOrientation(.portrait , andRotateTo: .portrait)
        
        //Sets title of tab
         self.tabBarController?.navigationItem.title = "Code";
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Don't forget to reset when view is being removed
        AppUtility.lockOrientation(.portrait)
    }
    
}

////////////// Must change the data.count !!!!!!!
var tap1 = Array(repeating: false, count: data.count)
var tap2 = Array(repeating: false, count: data.count)

//MARK: -Extension Delegate
extension CodeVC : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        
        if (tap1[myIndex] == false && tap2[myIndex] == false) {tap1[myIndex]=true}
            
        else if (tap1[myIndex] == true && tap2[myIndex] == false) {
            tap1[myIndex]=false
            tap2[myIndex]=true
        }
            
        else if (tap1[myIndex] == false && tap2[myIndex] == true) {tap2[myIndex]=false}
     
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.fade)
    }
}

//MARK: -Extension DataSource
extension CodeVC : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCode.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        myIndex = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCode") as! CodeCell
        
        cell.code.text = cellCode[indexPath.row] as! String
        if (tap1[myIndex] == false && tap2[myIndex] == false){cell.tapLabel.text = nil
            cell.tapLabelBottomConstraint.constant = -33
            cell.tapLabel.backgroundColor = UIColor.white
            cell.tapLabel.textColor = UIColor.black
            cell.tapLabel.font = UIFont.systemFont(ofSize: 14)
        }
        else if (tap1[myIndex] == true && tap2[myIndex] == false){
            cell.tapLabel.text = cellRun[indexPath.row] as! String
            cell.tapLabelBottomConstraint.constant = 0
            cell.tapLabel.backgroundColor = UIColor.black
            cell.tapLabel.textColor = UIColor.white
            cell.tapLabel.font = UIFont(name: "Avenir Book", size: 14)
            
        }
        else if (tap1[myIndex] == false && tap2[myIndex] == true){
            cell.tapLabel.text = cellDesc[indexPath.row] as! String
            cell.tapLabelBottomConstraint.constant = 0
        }
        
        //Highlighting
        let highlightedCode = textStorage.highlightr.highlight(cell.code.text, as: "c++")
        
        cell.code.attributedText = highlightedCode
        cell.code.backgroundColor = textStorage.highlightr.theme.themeBackgroundColor
        
        return cell
    }
}














