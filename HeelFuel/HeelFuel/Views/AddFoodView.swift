//
//  AddFoodView.swift
//  HeelFuel
//
//  Created by Mitchell Anderson on 4/17/23.
//g

import SwiftUI

struct AddFoodView: View {
    @Binding var meal: MealModel
    @StateObject var vm: AddFoodViewModel
    
    var body: some View {
        NavigationStack {
            switch vm.state {
            case .success(let foods):
                VStack {
                    List {
                        ForEach(foods[meal.index!]) { item in
                            Section {
                                NavigationLink (destination: FoodDetailView(meal: $meal, vm: vm, food: item.self)) {
                                    VStack (alignment: .leading, spacing: 4){
                                        Text("\(item.name)").font(.headline)
                                        Text("\(item.calories)").font(.subheadline).foregroundColor(.gray)
                                    }
                                    .listRowInsets(EdgeInsets(top: 2, leading: 0, bottom: 0, trailing: 0))
                                }
                                    }
                                }
                            }
                        }
            case .idle:
                ProgressView()
            case .loading:
                ProgressView()
            case .error(_):
                ProgressView()
            }
        }.navigationBarTitle("\(meal.mealTime) Foods")
            .onAppear(){
                vm.findFoods()
            }
        
            

    }
        
}


struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodView(meal: HomeView().$breakfast, vm: AddFoodViewModel())
    }
}
