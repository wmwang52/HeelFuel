//
//  CDDataModel.swift
//  HeelFuel
//
//  Created by Milan Dutta on 4/10/23.
//

//MARK: Creates the DataModel used for CoreData

import Foundation
import CoreData

class CDDataModel: ObservableObject {
    let container: NSPersistentContainer
    
    @Published var saveBreakfastEntity: [BreakfastEntity] = []
    @Published var saveLunchEntity: [LunchEntity] = []
    @Published var saveValueEntity: [ValueEntity] = []

    init() {
        container = NSPersistentContainer(name: "CDfoodclass")
        container.loadPersistentStores{(descip,error) in
            if let error = error {
                print("error loading data \(error)")
            }
        }
        fetchData()
    }
    
    func fetchData() {
        let requestOne = NSFetchRequest<BreakfastEntity>(entityName: "BreakfastEntity")
        let requestTwo = NSFetchRequest<LunchEntity>(entityName: "LunchEntity")
        let requestThree = NSFetchRequest<ValueEntity>(entityName: "ValueEntity")
        do {
            saveBreakfastEntity = try container.viewContext.fetch(requestOne)
            saveLunchEntity = try container.viewContext.fetch(requestTwo)
            saveValueEntity = try container.viewContext.fetch(requestThree)
        } catch let error {
            print("error fetching data \(error)")
        }
                                                       
    }
    func addBreakfast(icon: String, name: String, ingredients: String, fat: CGFloat, protein: CGFloat, carbs: CGFloat) {
        let newMeal = BreakfastEntity(context: container.viewContext)
//        newMeal.icon = icon
//        newMeal.name = name
//        newMeal.ingredients = ingredients
        newMeal.fat = Float(fat)
        newMeal.protein = Float(protein)
        newMeal.carbs = Float(carbs)
        saveData()
    }
    func addLunch(icon: String, name: String, ingredients: String, fat: CGFloat, protein: CGFloat, carbs: CGFloat) {
        let newMeal = LunchEntity(context: container.viewContext)
//        newMeal.icon = icon
//        newMeal.name = name
//        newMeal.ingredients = ingredients
        newMeal.fat = Float(fat)
        newMeal.protein = Float(protein)
        newMeal.carbs = Float(carbs)
        saveData()
    }
    func addValue(fat: CGFloat, protein: CGFloat, carbs: CGFloat) {
        let newValue = NSFetchRequest<ValueEntity>(entityName: "ValueEntity")
        do {
            let results = try container.viewContext.fetch(newValue)
            if let entity = results.first {
                entity.fat += Float(fat)
                entity.protein += Float(protein)
                entity.carbs += Float(carbs)
            } else {
                let newValue = ValueEntity(context: container.viewContext)
                newValue.fat = Float(fat)
                newValue.protein = Float(protein)
                newValue.carbs = Float(carbs)
            }
            saveData()
            fetchData()
        } catch {
            print("\(error)")
        }
    }
    func addRingCalories(calories: CGFloat) {
        let newCal = NSFetchRequest<ValueEntity>(entityName: "ValueEntity")
        do {
            let results = try container.viewContext.fetch(newCal)
            if let entity = results.first {
                entity.ring += Float(Int(calories))
            }
        } catch {
            print("\(error)")
        }
        saveData()
        fetchData()
    }
    func addMealToggle(meal: BreakfastEntity) {
       // meal.addmeal.toggle()
        saveData()
    }
    
    
     func saveData() {
        do {
            try container.viewContext.save()
        } catch {
            print("save data failed \(error)")
        }
    }
}
 
