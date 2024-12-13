//
//  QuestionModel.swift
//  Quiz-App
//
//  Created by Rohan Maheshbhai Khambhadiya on 2024-12-13.
//

import Foundation

class QuestionModel {
    var question : String = ""
    var correctAnswer : String = ""
    var incorrectAnswer1 : String = ""
    var incorrectAnswer2 : String = ""
    var incorrectAnswer3 : String = ""
    var answer = Answer(isCorrect: true, text: "" )
//    var isCorrect: Bool
    init(question: String, correctAnswer: String, incorrectAnswer1: String, incorrectAnswer2: String, incorrectAnswer3: String, answer : Answer) {
        self.question = question
        self.correctAnswer = correctAnswer
        self.incorrectAnswer1 = incorrectAnswer1
        self.incorrectAnswer2 = incorrectAnswer2
        self.incorrectAnswer3 = incorrectAnswer3
        self.answer = Answer(isCorrect: true, text: correctAnswer)
    }
    
    func toString() -> String{
        return "\(question)"
    }
    func isAnswerCorrect(selectedAnswer: Answer) -> Bool {
               return selectedAnswer.isCorrect
        }
}
class Answer{
    var text : String = ""
    var isCorrect : Bool
    init(isCorrect: Bool, text: String) {
        self.isCorrect = isCorrect
        self.text = text
    }
}

class QuestionManager {
   public static var shared = QuestionManager()
    
    var questions: [QuestionModel] = []

    
    func addNewQuestion(q: QuestionModel){
        questions.append(q)
    }
    
    func deleteQuestion(qIndex : Int){
        questions.remove(at: qIndex)
    }
    func isCorrect() -> Bool{
        return true
    }
    
}
