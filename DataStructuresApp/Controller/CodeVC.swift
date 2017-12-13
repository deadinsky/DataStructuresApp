import Foundation
import UIKit

class CodeVC: UIViewController {
    var myIndex = 5
    var mySecondIndex = 5
    var subLessonData : String = ""
    
    @IBOutlet weak var textfield: UILabel!
    @IBOutlet weak var codeText: UITextView!
    
    override func viewDidLoad() {
//        textfield.text = "\(myIndex) \(mySecondIndex)"
        print("in code vc")
        print(subLessonData)
        codeText.text = subLessonData
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
