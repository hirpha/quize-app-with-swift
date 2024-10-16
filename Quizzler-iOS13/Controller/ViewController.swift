//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var questions = [
        Question(q: "What is your name?", a: "True"),
        Question(q: "What is your age?", a: "False"),
        Question(q: "What is your height?", a: "True"),
        Question(q: "What is your weight?", a: "False"),
        Question(q: "What is your favourite colour?", a: "False")]
      
    var score = 0
    var currentQuestion = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestion].question
        // Do any additional setup after loading the view.
    }
    
   func updateButtonbackgroundColor()  {
       trueButton.backgroundColor = .clear
       falseButton.backgroundColor = .clear
        }
    
    @IBAction func answerQuestion(_ sender: UIButton) {
        print(sender.titleLabel?.text ?? " ")
        
        if currentQuestion == questions.count - 1 {
           
            progressBar.progress = 1
            currentQuestion+=1
            questionLabel.text = "You have got \(score) out of \(questions.count) questions correct"
          
            trueButton.isHidden = true
            falseButton.isHidden = true
            
        }
        
     
    if currentQuestion < questions.count {
        if sender.titleLabel?.text == questions[currentQuestion].answer {
            sender.backgroundColor = .green
            score += 1
            currentQuestion+=1
            progressBar.progress = Float(currentQuestion)/Float(questions.count)
        
            questionLabel.text = questions[currentQuestion].question
           
            print(progressBar.progress )
            Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { timer in
                self.updateButtonbackgroundColor()
            }
        } else{
            sender.backgroundColor = .red
            currentQuestion+=1
            progressBar.progress = Float(currentQuestion)/Float(questions.count)
            print(progressBar.progress )
            questionLabel.text = questions[currentQuestion].question
            Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { timer in
                self.updateButtonbackgroundColor()
            }

        }
        }
        
        print("here we are")
     
        
    }
    
}

