//
//  WelcomeView.swift
//  TryingAgain
//
//  Created by Jordan Becker on 4/11/23.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var vm: WelcomeViewModel
    
    var body: some View {
        if vm.userSession != nil {
            Clouds()
                .sheet(isPresented: $vm.notTakenQuiz, content: { QuestionView() })
                
        } else {
            signIn
        }
    }
    
    var signIn: some View {
        ZStack {
            Color("CarolinaBlue")
            if vm.tryingToLogIn {
                logIn
            } else {
                signUp
            }
        }
        .ignoresSafeArea()
    }
    
    var signUp: some View {
        VStack(spacing: 20) {
            Text("Welcome")
                .font(.system(size: 40, weight: .bold))
                .frame(width: 300, height: 200)
            
            HStack {
                Image(systemName: "envelope")
                TextField("Email", text: $vm.email)
                    .foregroundColor(.black)
            }
                
            Divider()
                
            HStack {
                Image(systemName: "lock")
                SecureField("Password", text: $vm.password)
                    .foregroundColor(.black)
            }
                
            Divider()
                
            Button {
                vm.register()
                print(vm.userLoggedIn)
            } label: {
                Text("Sign Up")
                    .foregroundColor(.black)
                    .bold()
                    .frame(width: 200, height: 50)
                    .background(RoundedRectangle(cornerRadius: 10))
            }
            .shadow(radius: 100)
            
            Button {
                vm.tryingToLogIn = true
            } label: {
                HStack {
                    Text("Already have an account?")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                    Text("Log in")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                }
                .padding()
            }
        }
        .foregroundColor(.white)
        .frame(width: 350)
    }
    
    var logIn: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Log in")
                    .font(.system(size: 40, weight: .bold))
                    
                Spacer()
                
                Button {
                    vm.tryingToLogIn = false
                } label: {
                    Image(systemName: "xmark")
                }
            }
            .offset(y: -150)
            
            HStack {
                Image(systemName: "envelope")
                TextField("Email", text: $vm.email)
                    .foregroundColor(.black)
            }
                
            Divider()
                
            HStack {
                Image(systemName: "lock")
                SecureField("Password", text: $vm.password)
                    .foregroundColor(.black)
            }
                
            Divider()
                
            Button {
                vm.signIn()
                print(vm.userLoggedIn)
            } label: {
                Text("Log In")
                    .foregroundColor(.black)
                    .bold()
                    .frame(width: 200, height: 50)
                    .background(RoundedRectangle(cornerRadius: 10))
            }
            .shadow(radius: 100)
        }
        .foregroundColor(.white)
        .frame(width: 350)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
