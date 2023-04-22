//
//  QuestionView.swift
//  TryingAgain
//
//  Created by Jordan Becker on 4/13/23.
//

import SwiftUI

struct QuestionView: View {
    @StateObject var vm = QuizViewModel()
    @EnvironmentObject var submitAnswers: WelcomeViewModel
    @State private var answer = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(vm.questions[vm.currQuestion].question)
                    .font(.title)
                    
                Spacer()
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                }
            }
            .frame(height:300)
            
            
            VStack {
                TextField(vm.questions[vm.currQuestion].fieldName, text: $answer)
                    .bold()
                    .font(.system(size: 30))
                    .multilineTextAlignment(.center)
                
                if answer != "" && vm.validResponse(answer: answer) {
                    if vm.currQuestion != vm.questions.count - 1 {
                        nextButton
                            .bold()
                            .frame(width: 200, height: 50)
                            .background(RoundedRectangle(cornerRadius: 10))
                            .multilineTextAlignment(.center)
                    }
                    else {
                        Button {
                            vm.storeAnswer(answer: answer)
                            vm.submitResponse(answer: answer)
                            submitAnswers.fetchUserData()
                            //presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Done")
                                .foregroundColor(.white)
                        }
                        .bold()
                        .frame(width: 200, height: 50)
                        .background(RoundedRectangle(cornerRadius: 10))
                        .multilineTextAlignment(.center)
                    }
                }
            }
            Spacer()
            
            
        }
        .ignoresSafeArea()
        .padding()
        .background(Color("CarolinaBlue"))
    }
    
    var nextButton: some View {
        Button {
            if vm.validResponse(answer: answer) {
                vm.storeAnswer(answer: answer)
                answer = ""
                vm.currQuestion += 1
            }
            
        } label: {
            Text("Next")
                .foregroundColor(.white)
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
