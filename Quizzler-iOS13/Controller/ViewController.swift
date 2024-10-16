//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    var quizBrain = QuizBrain()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text =  ""
        questionLabel.text = quizBrain.getQuestion().question
        print(quizBrain.getQuestion().answer)
        choice1.setTitle(quizBrain.getQuestion().answer[0], for: .normal)
        choice2.setTitle(quizBrain.getQuestion().answer[1], for: .normal)
        choice3.setTitle(quizBrain.getQuestion().answer[2], for: .normal)
        // Do any additional setup after loading the view.
 
    }
    
   func updateButtonbackgroundColor()  {
       choice1.backgroundColor = .clear
       choice2.backgroundColor = .clear
       choice3.backgroundColor = .clear
       
        }
    
    @IBAction func answerQuestion(_ sender: UIButton) {
        let ansewr = sender.titleLabel?.text ?? " "
        
        let isCorrectAnswer = quizBrain.checkAnswer(ansewr)
        scoreLabel.text = "Score = \(quizBrain.score)"
        if quizBrain.isEnd() {
            
            progressBar.progress = 1
            questionLabel.text = "You have got \(quizBrain.score) out of \(quizBrain.questions.count) questions correct"
            
            choice1.isHidden = true
            choice2.isHidden = true
            choice3.isHidden = true
            
        }
        
        
        if quizBrain.checkNextQuestion() {
            if isCorrectAnswer {
                sender.backgroundColor = .green
                updateUi()
            } else{
                sender.backgroundColor = .red
                updateUi()
                
            }
        }
    }
         
        func updateUi() {
            progressBar.progress = quizBrain.getProgress()
        
            questionLabel.text = quizBrain.getQuestion().question
            choice1.setTitle(quizBrain.getQuestion().answer[0], for: .normal)
            choice2.setTitle(quizBrain.getQuestion().answer[1], for: .normal)
            choice3.setTitle(quizBrain.getQuestion().answer[2], for: .normal)
           
    
            Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { timer in
                self.updateButtonbackgroundColor()
        }
     
        
    }
    
}

