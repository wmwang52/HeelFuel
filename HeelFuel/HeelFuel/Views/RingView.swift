//
//  RingView.swift
//  HeelFuel
//
//  Created by Milan Dutta on 4/10/23.
//

// MARK: View that displays the calories and macros eaten

import SwiftUI

struct customShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
}

struct RingView: View {
    @EnvironmentObject var vm: AddFoodViewModel

    // Varaibles dealing with Macros
    var macroGoals: Float = 2000
    var gramsString: String = "g"
    var carbGoal: Float = 200
    var fatGoal: Float = 200
    var proteinGoal: Float = 200

    let width: CGFloat = 140
    let height: CGFloat = 140
    let calorieIndicator: String = "cal"
    var userCalorieGoal: Int = 3000

    var multiplier: Double {
        return Double(width) / Double(44)
    }

    var progress: Double {
        return 1 - Double(vm.totalCalories) / Double(3000)
    }

    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .stroke(Color.blue.opacity(0.1), style: StrokeStyle(lineWidth: 4 * multiplier))
                    .frame(width: width, height: height)
                Circle()
                    .trim(from: progress, to: 1)

                    .stroke(LinearGradient(gradient: Gradient(colors: [Color("RingColor"), .blue]), startPoint: .top, endPoint: .bottom),
                            style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0))

                    .rotationEffect(Angle(degrees: 90))
                    .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                    .frame(width: width, height: height)
                Text("\(vm.totalCalories) \(calorieIndicator)").bold()
                    .font(.title2)
            }
            .padding()

            HStack(spacing: 30) {
                FoodElementView(title: "Carbs", color: "CarbColor", current: vm.carbs, maximum: 200)
                FoodElementView(title: "Fat", color: "FatColor", current: vm.fat, maximum: 80)
                FoodElementView(title: "Protein", color: "ProteinColor", current: vm.protein, maximum: 120)

                    .offset(x: -5)
            }
        }
        .frame(height: 180)
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(20)
        .modifier(customShadow())
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView()
            .environmentObject(AddFoodViewModel())
    }
}

struct FoodElementView: View {
//    var element: String = ""
//    var gram: CGFloat = 0
//    var color: String = ""
//    var elementValue: CGFloat = 0

    let title: String
    let color: String
    let current: Int
    let maximum: Int

    private let width: CGFloat = 8
    private let maxHeight: CGFloat = 130

    private var adjustedHeight: CGFloat {
        let fraction = Double(current) / Double(maximum)
        return min(1, fraction) * maxHeight
    }

    var body: some View {
        VStack {
            HStack {
                ZStack(alignment: .bottom) {
                    Rectangle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(width: 8, height: maxHeight)

                    Rectangle()
                        .fill(Color(color))
                        .frame(width: width, height: adjustedHeight)
                }
                .cornerRadius(10)

                ZStack(alignment: .bottom) {
                    Rectangle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(width: 8, height: maxHeight)

                    Rectangle()
                        .fill(Color("CarolinaBlue"))
 
                }
                .cornerRadius(10)
            }

            Text("\(title)")
                .font(.system(size: 12))

        }
    }
}
