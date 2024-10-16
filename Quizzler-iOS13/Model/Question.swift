//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by mac on 10/15/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
   var question: String
   var  answer: [String]
        var correctAnswer :String
    
    init(q: String, a: [String], correctAnswer:String) {
        self.question = q
        self.answer = a
        self.correctAnswer = correctAnswer
    }
}
