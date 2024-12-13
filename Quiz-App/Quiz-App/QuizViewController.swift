//
//  QuizViewController.swift
//  Quiz-App
//
//  Created by Rohan Maheshbhai Khambhadiya on 2024-12-13.
//

import UIKit

class QuizViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var questionList = QuestionManager.shared
        var selectedAnswers: [String?] = []
        var answeredQuestions: [Bool] = []
    
    @IBOutlet weak var questionText: UILabel!
    
   
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var optionsTable: UITableView!
    
    
    
    
    
    
    
    var selectedIndex: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        optionsTable.dataSource = self
               optionsTable.delegate = self
               
               
               
               selectedAnswers = Array(repeating: nil, count: questionList.questions.count)
               answeredQuestions = Array(repeating: false, count: questionList.questions.count)

       //        submitButton.isHidden = true
               updateQuestion()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func previousClicked(_ sender: Any) {
        if selectedIndex > 0 {
                    selectedIndex -= 1
                    updateQuestion()
                } else {
                    print("First question")
                }
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        if selectedIndex < questionList.questions.count - 1 {
                    selectedIndex += 1
                    updateQuestion()
                } else {
                    print("Quiz Completed")
                }
    }
    
    
    
    
    
    func updateQuestion() {
           let currentQuestion = questionList.questions[selectedIndex]
           
           questionText.text = currentQuestion.question
           
        shuffleAnswers()
           progressBar.progress = Float(selectedIndex + 1) / Float(questionList.questions.count)
           
           optionsTable.reloadData()
           
           if let selectedAnswer = selectedAnswers[selectedIndex], selectedAnswer != "" {
               answeredQuestions[selectedIndex] = true
           } else {
               answeredQuestions[selectedIndex] = false
           }
           
           if selectedIndex == questionList.questions.count - 1 && !answeredQuestions.contains(false) {
               //submitButton.isHidden = false
           } else {
               //submitButton.isHidden = true
           }
       }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 4
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "optionCell", for: indexPath)
                
                // Use shuffled options for the current question
                let answer = shuffledOptions[indexPath.row]
                cell.textLabel?.text = answer
                
                // Mark selected answer with a checkmark
                if selectedAnswers[selectedIndex] == answer {
                    cell.accessoryType = .checkmark
                } else {
                    cell.accessoryType = .none
                }
                
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedAnswer = shuffledOptions[indexPath.row] // Get selected answer from shuffled options
                
                selectedAnswers[selectedIndex] = selectedAnswer
                answeredQuestions[selectedIndex] = true
                tableView.reloadData()
        }
        
    func submitQuiz() -> Int{
           var score = 0
           
           if answeredQuestions.contains(false) {
               let alert = UIAlertController(title: "Error", message: "Please answer all questions before submitting.", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
               present(alert, animated: true, completion: nil)
           }
           
           for (index, selectedAnswerText) in selectedAnswers.enumerated() {
               guard let selectedAnswerText = selectedAnswerText else { continue }
               
               let currentQuestion = questionList.questions[index]

//               if let selectedAnswer = currentQuestion.correctAnswer  {
//                   if currentQuestion.isAnswerCorrect(selectedAnswer: selectedAnswer) {
//                       score += 1
//                   }
//               }
           }
           
           return score
           
       }
    var shuffledOptions: [String] = [] // Store shuffled options for the current question

    func shuffleAnswers() {
        let currentQuestion = questionList.questions[selectedIndex]
        
        // Combine all answers into an array and shuffle
        shuffledOptions = [
            currentQuestion.correctAnswer,
            currentQuestion.incorrectAnswer1,
            currentQuestion.incorrectAnswer2,
            currentQuestion.incorrectAnswer3
        ].shuffled()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
               if segue.identifier == "showScore" {
                   if let destinationVC = segue.destination as? ResultViewController {
                            destinationVC.result = submitQuiz()
                       }
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


