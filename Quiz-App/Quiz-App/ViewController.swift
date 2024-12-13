//
//  ViewController.swift
//  Quiz-App
//
//  Created by Rohan Maheshbhai Khambhadiya on 2024-12-13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startQuizButton: UIButton!
    var questionList = QuestionManager.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
     override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
//    if questionList.questions.isEmpty {
//        startQuizButton.isEnabled = false
//    } else {
//        startQuizButton.isEnabled = true
//    }
}

}

