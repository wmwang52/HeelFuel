//
//  QCardView.swift
//  TryingAgain
//
//  Created by Jordan Becker on 4/17/23.
//

import SwiftUI

struct QCardView: View {
    @State private var answer = ""
    var body: some View {
        
        VStack(alignment: .center) {
            TextField("Name", text: $answer)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.green)
        .cornerRadius(10)
        .shadow(color: Color.gray, radius: 10)
        .ignoresSafeArea()
    }
}

struct QCardView_Previews: PreviewProvider {
    static var previews: some View {
        QCardView()
    }
}
