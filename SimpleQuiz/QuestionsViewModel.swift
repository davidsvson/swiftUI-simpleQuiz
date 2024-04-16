//
//  QuestionsViewModel.swift
//  SimpleQuiz
//
//  Created by David Svensson on 2024-04-16.
//

import Foundation



class QuestionsViewModel : ObservableObject {
    var questions : [Question] = [Question(question: "När är det Julafton?", correctAnswer: "24 dec",                                   incorrectAnswers: ["1 jan", "6 maj", "4 okt"]),
                                  Question(question: "Vilket är svårast??", correctAnswer: "Java", incorrectAnswers: ["Swift", "Kotlin", "Javascript"]),
                                  Question(question: "Vilket är bäst", correctAnswer: "Zoom", incorrectAnswers: ["Teams", "Discord", "Slack"]),
                                  Question(question: "Vilket OS är bäst", correctAnswer: "iOS", incorrectAnswers: ["android", "macOS", "windows"]),
                                ]
    
    @Published var currentQuestion : Question
    var currentAnswers : [String] = []
    private var currentIndex = 0
    

    init() {
        questions.shuffle()
        currentQuestion = questions[currentIndex]
        createAnswers()
    }
    
    private func createAnswers() {
        var answers = currentQuestion.incorrectAnswers
        answers.append(currentQuestion.correctAnswer)
        answers.shuffle()
        currentAnswers = answers
    }
    
    func isCorrect(answer: String) -> Bool {
        return answer == currentQuestion.correctAnswer
    }
    
    
    func nextQuestion() {
        
        if currentIndex < questions.count - 1 {
            currentIndex += 1
        } else {
            currentIndex = 0
            questions.shuffle()
        }
        
        currentQuestion = questions[currentIndex]
        createAnswers()
    }
    
    
    
}
