//
//  ContentView.swift
//  SimpleQuiz
//
//  Created by David Svensson on 2024-04-16.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var questionsVM = QuestionsViewModel()
    
    @State var score : Int = 0
    
    
    var body: some View {
        VStack {
            Text("\(score)")
            Spacer()
            Text(questionsVM.currentQuestion.question)
            Spacer()
            ForEach(questionsVM.currentAnswers, id: \.self) { answer in
                Button(answer) {
                    handleAnswer(answer: answer)
                }
            }
            Spacer()
            
        }
        
    }
    
    func handleAnswer(answer: String) {
        
        // kolla om korrekt svar
        if questionsVM.isCorrect(answer: answer) {
            score += 1
        }
        
        // gå vidare till nästa fråga
        questionsVM.nextQuestion()
    }
    
    
    
}

#Preview {
    ContentView()
}



// x lista av frågor
// x enkel layout för en fråga och svarsalternativ

// x ta emot input på knapparna
// x gå vidare till nästa fråga
// x räkna poäng

// x mvvm struktur

// x slumpa ordning på svaren
// x inte samma fråga två gånger i rad

// layout



