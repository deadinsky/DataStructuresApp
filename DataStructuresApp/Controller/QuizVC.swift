import Foundation
import UIKit

class QuizVC: UIViewController {
    @IBOutlet weak var beginButton: UIButton!
    
    override func viewDidLoad() {
        beginButton.layer.cornerRadius = 5
    }
    
    // Controls orientation
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        DataSingleton.shared.numberCorrect = 0
        
        //AppUtility.lockOrientation(.portrait)
        // Or to rotate and lock
//        AppUtility.lockOrientation(.portrait , andRotateTo: .portraitUpsideDown)
//        AppUtility.lockOrientation(.portrait , andRotateTo: .portrait)
        
        //Sets title of tab
//        self.tabBarController?.navigationItem.title = "Quiz";
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//
//        // Don't forget to reset when view is being removed
//        AppUtility.lockOrientation(.portrait)
//    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! QuizQuestionsVC
        destVC.questionNumber = 0
        
    
        let hour = Calendar.current.component(.hour, from: Date())
        let minutes = Calendar.current.component(.minute, from: Date())
        let seconds = Calendar.current.component(.second, from: Date())
        
        DataSingleton.shared.quizStartTime = Double(hour*3600 + minutes*60 + seconds)

    }
    
    
}

