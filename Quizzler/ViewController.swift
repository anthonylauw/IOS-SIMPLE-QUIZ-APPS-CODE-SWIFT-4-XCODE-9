//
//  ViewController.swift
//  Quizzlio
//
//  Created by Anthonylauw on 18/11/2017.
//  Copyright (c) 2017 Anthonylauw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var score : Int = 0
    var questionNumber : Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        // Make pickedAnswer equal to true if the true button with tag 1 is pressed
        if sender.tag == 1 {
            pickedAnswer = true
        }
            
            // Make pickedAnswer equal to false if the false button with tag 2 is pressed
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        checkAnswer()
        questionNumber = questionNumber + 1
        
        updateUI()
  
    }
    
    
    func updateUI() {
        progressBar.frame.size.width = (view.frame.size.width/13)*CGFloat(questionNumber)
        progressLabel.text = String(questionNumber) + "/13"
        scoreLabel.text = "Score:" + String(score)
        
        nextQuestion()
    }
    

    func nextQuestion() {
        
        // If we have not reached the end, update the question displayed
        if questionNumber <= 12 {
            questionLabel.text = allQuestions.list[questionNumber].questionText
            
            // else show a pop up alert to the user
        } else {
            
            // 1. Create a UIAlertController named alert
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions. Do you want to start over?", preferredStyle: .alert)
            
            // 2. Make the button on this alert call the startOver() method
            let restartAction = UIAlertAction(title: "Hell Yeah", style: .default, handler: { UIAlertAction in self.startOver()
            })
            
            // 3. Add the UIAlertAction to the UIAlertController
            alert.addAction(restartAction)
            
            // 4. Present the alert to make it appear on screen
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if pickedAnswer == correctAnswer {
            print("Yup, you got it")
            ProgressHUD.showSuccess("Correct!")
            score = score + 1
        } else {
            print("Wrong!")
            ProgressHUD.showError("Wrong")
        }
        
    }
    
    
    func startOver() {
        questionNumber = 0
        score = 0
        
        updateUI()
    }
    

    
}
