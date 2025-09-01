//
//  MealSectionView.swift
//  HeelFuel
//
//  Created by Milan Dutta on 4/14/23.
//

//MARK: View that displays the information of a meal in HomeView

import SwiftUI

struct MealSectionView: View {
    var icon: String
    var mealTime: String
    var calories: String

    var body: some View {
        HStack {
            Text(icon)
                .padding(.horizontal, 10)

            VStack(alignment: .leading) {
                Text(mealTime)
                    .fontWeight(.bold)
                if calories != "" {
                    Text("\(calories) cal")
                        .foregroundColor(.secondary)
                        .font(.subheadline)
                }
                
            }
            Spacer()
            Image(systemName: "plus")
                .font(.title)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.blue)
                .cornerRadius(40)
        }
        .padding([.horizontal, .vertical], 20)
        .background(Color.white)
    }
}

struct MealSectionView_Previews: PreviewProvider {
    static var previews: some View {
        MealSectionView(icon: "🍳", mealTime: "Breakfast", calories: " 856/847")
    }
}
