import Foundation
import UIKit
import Highlightr

class VisualizationVC: UIViewController {
    var myIndex = 5
    var mySecondIndex = 5
    var subLessonData = [String : Any]()
    
    @IBOutlet weak var textfield: UITextView!
    
    @IBOutlet weak var firstScrollView: UITextView!
    @IBOutlet weak var secondScrollView: UITextView!
    override func viewDidLoad() {
//        textfield.text = "\(myIndex) \(mySecondIndex)"
        print("in visualization vc")
        print(subLessonData)
        secondScrollView.text = subLessonData["VisulizationCode"] as! String

        //Syntax Highlighting
        let highlightr = Highlightr()
        highlightr?.setTheme(to: "paraiso-dark")
        let code = subLessonData["VisulizationCode"] as! String
        // You can omit the second parameter to use automatic language detection.
        let highlightedCode = highlightr?.highlight(code, as: "c++")
        firstScrollView.attributedText = highlightedCode
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //AppUtility.lockOrientation(.portrait)
        // Or to rotate and lock
        AppUtility.lockOrientation(.landscape , andRotateTo: .landscapeRight)
        
        //Sets title of tab
          self.tabBarController?.navigationItem.title = "Visualization";
    }
    
    
    // Controls orientation
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Don't forget to reset when view is being removed
        AppUtility.lockOrientation(.portrait) 
    }
   }
