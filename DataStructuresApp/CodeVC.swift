import Foundation
import UIKit

class CodeVC: UIViewController {
    var myIndex = 5
    var mySecondIndex = 5
    
    @IBOutlet weak var textfield: UILabel!
    
    
    override func viewDidLoad() {
        textfield.text = "\(myIndex) \(mySecondIndex)"
    }
    
}
