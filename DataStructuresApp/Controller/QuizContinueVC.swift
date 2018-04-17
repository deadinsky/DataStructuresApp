import Foundation
import UIKit

class QuizContinueVC : UIViewController {
    var questions = [Any]()
    var questionNumber = 0
    var selectedAnswer = [Int]()
    var totalQuestions = 0
    var answerCorrect = false

    @IBOutlet weak var nextQuestion: UIButton!
    @IBOutlet weak var correctField: UITextField!
    @IBOutlet weak var correctAnswerField: UITextView!
    @IBAction func NextQuestion(_ sender: Any) {
        if questionNumber == (questions.count - 1){
            performSegue(withIdentifier: "quizFinish", sender: self)
        }
        else{
            performSegue(withIdentifier: "quizContinue", sender: self)
        }
    }
    
    override func viewDidLoad() {
        nextQuestion.layer.cornerRadius = 5
    }

    override func viewWillAppear(_ animated: Bool) {
        //answer checking // default setup is for correct case
        answerCorrect = false
        let fullQuestion = questions[questionNumber] as! [String: Any]
        let questionType = fullQuestion["Question-Type"] as! String
        let correctAnswer = fullQuestion["Correct-Answer"] as! [Int]
        let answers = fullQuestion["Answers"] as! [String]
        
        print("selected ansswer", selectedAnswer)
        print(correctAnswer)
        totalQuestions += 1
        
        if questionType == "ranking"{
            if correctAnswer == selectedAnswer {
                answerCorrect = true
            }
        } else {
                if (correctAnswer.sorted() == selectedAnswer.sorted()){
                    answerCorrect = true
                }
        }

        //show correcr answer
        if !answerCorrect {
            //show correct answer
            self.view.backgroundColor = UIColor(red: 255.0/255, green: 26.0/255, blue: 26.0/255, alpha: 1)
            correctField.text = "Wrong!"
            correctAnswerField.isHidden = false //correct answer field is hidden by default
            var temp = "The correct answer is:\n"
            for i in correctAnswer{
                temp.append("-\(answers[i])\n")
            }
            correctAnswerField.text = temp
        } else {
            DataSingleton.shared.numberCorrect += 1
        }
        print(selectedAnswer)
    
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if questionNumber == (questions.count - 1){
            // pass data for analytics
            let quizQuestionsVC = segue.destination as! QuizFinish
            quizQuestionsVC.questions = questions
        }
        else{
            let quizQuestionsVC = segue.destination as! QuizQuestionsVC
            quizQuestionsVC.questionNumber = questionNumber + 1
            quizQuestionsVC.questions = questions
        }
       
    }
}
