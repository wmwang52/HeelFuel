//
//  Clouds.swift
//  TryingAgain
//
//  Created by Jordan Becker on 4/11/23.
//

import SwiftUI

struct Clouds: View {
    @EnvironmentObject var vm: WelcomeViewModel
    
    var body: some View {
        VStack  {
            
            Text("Hello, \(vm.name)")
            
            Button {
                vm.signOut()
            } label: {
                Text("log out")
            }
            
            
            /*
            Circle()
                .foregroundColor(Color(.white))
                .frame(width: 100, height: 100)
            
            Circle()
                .foregroundColor(Color(.white))
                .frame(width: 100, height: 100)
                .offset(x:50, y:50)
            */
            
        }
        .frame(width: 1000, height: 1000)
        .background(Color("CarolinaBlue"))
        
        
    }
}

struct Clouds_Previews: PreviewProvider {
    static var previews: some View {
        Clouds()
    }
}
