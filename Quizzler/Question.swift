//
//  Question.swift
//  Quizzler
//
//  Created by Anthonylauw on 19/11/17.
//  Copyright © 2017 Anthonylauw. All rights reserved.
//

import Foundation

class Question {
    
    let questionText : String
    var answer : Bool
    
    init(text: String, correctAnswer: Bool){
        questionText = text
        answer = correctAnswer
    }
}
