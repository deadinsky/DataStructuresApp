import Foundation
import UIKit

class SummaryVC: UIViewController {
    var myIndex = 5
    var mySecondIndex = ""
    
    @IBOutlet weak var textfield: UILabel!
    
        
    override func viewDidLoad() {
        textfield.text = "\(myIndex) \(mySecondIndex)"
        
    }
    
    
    // Controls orientation
   override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //AppUtility.lockOrientation(.portrait)
        // Or to rotate and lock
        AppUtility.lockOrientation(.portrait , andRotateTo: .portrait)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Don't forget to reset when view is being removed
        AppUtility.lockOrientation(.portrait)
    }
    
}
