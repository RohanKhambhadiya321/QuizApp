//
//  QuestionBankTableViewController.swift
//  Quiz-App
//
//  Created by Rohan Maheshbhai Khambhadiya on 2024-12-13.
//

import UIKit

class QuestionBankTableViewController: UITableViewController, QuestionBuilderDelegate, UpdateQuestionDelegate {
    func doneClicked(newQuestion: QuestionModel) {
        QuestionManager.shared.addNewQuestion(q: newQuestion)
        print("new question added")
        DispatchQueue.main.async {
                self.tableView.reloadData()
            }
    }
    
    
    
    
    func updateQuestion(index: Int, newQuestion: QuestionModel) {
        print(index)
        QuestionManager.shared.questions[index] = newQuestion
        DispatchQueue.main.async {
               self.tableView.reloadData()
           }    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return QuestionManager.shared.questions.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! QuestionCellUpdateTableViewCell
        
        let question = QuestionManager.shared.questions[indexPath.row]
        cell.questionText.text = question.question
        cell.correctAnswerText.text = question.correctAnswer
        cell.incorrectAnswer1Text.text = question.incorrectAnswer2
        cell.incorrectAnswer3Text.text = question.incorrectAnswer3
        return cell
    }
    
    func saveQuestion(newQuestion: QuestionModel){
        QuestionManager.shared.addNewQuestion(q: newQuestion)
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addQuestion"{
            if segue.identifier == "addQuestion" {
                   let addQuestionVC = segue.destination as! QuestionBuilderViewController
                   addQuestionVC.delegate = self
               }
        }
        else if segue.identifier == "updateQuestion"{
            let uvc = segue.destination as! QuestionCellUpdateViewController
            uvc.selectedIndex = tableView.indexPathForSelectedRow!.row
            uvc.delegate = self
        }
        func cancel() {
            
        }
        
        /*
         // Override to support editing the table view.
         override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == .delete {
         // Delete the row from the data source
         tableView.deleteRows(at: [indexPath], with: .fade)
         } else if editingStyle == .insert {
         // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
         }
         }
         */
        
        /*
         // Override to support rearranging the table view.
         override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
         
         }
         */
        
        /*
         // Override to support conditional rearranging of the table view.
         override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
         // Return false if you do not want the item to be re-orderable.
         return true
         }
         */
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
