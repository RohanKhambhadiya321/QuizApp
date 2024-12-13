//
//  ResultViewController.swift
//  Quiz-App
//
//  Created by Rohan Maheshbhai Khambhadiya on 2024-12-13.
//

import UIKit

class ResultViewController: UIViewController {
    var result: Int?
       var totalQuestions: Int? = QuestionManager.shared.questions.count
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let result = result, let totalQuestions = totalQuestions {
                           resultLabel.text = "Result: \(result)/\(totalQuestions)     Percentage: \(Double(result)/Double(totalQuestions)*100)"
                       } else {
                           resultLabel.text = "Error: Missing score or total questions"
                       }
        // Do any additional setup after loading the view.
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
