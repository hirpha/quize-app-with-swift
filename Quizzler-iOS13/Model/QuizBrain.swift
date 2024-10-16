//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by mac on 10/16/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation


struct QuizBrain{
    
    let questions = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
               Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
               Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
               Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
               Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
               Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
               Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
               Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
               Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
               Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
      
   
    var currentQuestion = 0
    var score = 0
    
    func checkNextQuestion() -> Bool{
        if currentQuestion < questions.count - 1{
            return true
        }else{
            return false
        }
    }
    
    
    func isEnd() -> Bool{
        if currentQuestion >= questions.count - 1{
            return true
        }else{
            return false
        }
    }
    func getProgress() -> Float{
        return Float(currentQuestion)/Float(questions.count)
    }
    /// check answer
    ///
    mutating func checkAnswer(_ answer: String) -> Bool{
 
        if questions[currentQuestion].correctAnswer == answer{
            score += 1
            nextQuestion()
            return true
        }else{
            nextQuestion()
            return false
        }
    }
    
    
    ///
    ///next question
    mutating func nextQuestion(){
        currentQuestion += 1
    }
    
    func getScore() -> Int{
        return score
    }
    
    /// get questions
    func getQuestion() -> Question{
        return questions[currentQuestion]
    }
    
    
    
}
