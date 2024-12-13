//
//  QuestionBuilderViewController.swift
//  Quiz-App
//
//  Created by Rohan Maheshbhai Khambhadiya on 2024-12-13.
//

import UIKit
protocol QuestionBuilderDelegate{
    func doneClicked(newQuestion: QuestionModel)
}
class QuestionBuilderViewController: UIViewController {

    
    var delegate : QuestionBuilderDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var questionText: UITextField!
    
    
    @IBOutlet weak var correctAnswerText: UITextField!
    
    @IBOutlet weak var incorrectAnswer1Text: UITextField!
    
    @IBOutlet weak var incorrectAnswer2Text: UITextField!
    
    
    @IBOutlet weak var incorrectAnswer3Text: UITextField!
    
    @IBAction func doneClicked(_ sender: UIBarButtonItem) {
        if let questionText = questionText.text , let correctAnswer = correctAnswerText.text,
           let incorrectAnswer1 = incorrectAnswer1Text.text,
           let incorrectAnswer2 = incorrectAnswer2Text.text,
           let incorrectAnswer3 = incorrectAnswer3Text.text
            
        {
            if !questionText.isEmpty , !correctAnswer.isEmpty, !incorrectAnswer1.isEmpty,
               !incorrectAnswer2.isEmpty, !incorrectAnswer3.isEmpty
            {
                let newQuestion = QuestionModel(question: questionText, correctAnswer: correctAnswer, incorrectAnswer1: incorrectAnswer1, incorrectAnswer2: incorrectAnswer2, incorrectAnswer3: incorrectAnswer3, answer: Answer(isCorrect: true, text: correctAnswer) )
                
                delegate?.doneClicked(newQuestion: newQuestion)
                navigationController?.popViewController(animated: true)
                dismiss(animated: true)
            }
            
            
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
