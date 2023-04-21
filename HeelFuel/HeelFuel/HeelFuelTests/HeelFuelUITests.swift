//
//  HeelFuelUITests.swift
//  HeelFuel
//
//  Created by Milan Dutta on 4/17/23.
//

//MARK: Tests the functionality of the Views

import XCTest

class AddFoodViewTests: XCTestCase {

    func testAddFoodView_InitialState() throws {
        let vm = AddFoodViewModel()
        
        let sut = AddFoodView(index: 0, mealTime: "Breakfast", vm: vm)
        
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.vm.state, .idle)
    }
    
    func testAddFoodView_LoadingState() throws {
        let vm = AddFoodViewModel()
        vm.state = .loading
        
        let sut = AddFoodView(index: 0, mealTime: "Breakfast", vm: vm)
        
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.vm.state, .loading)
        XCTAssertNotNil(sut.body)
        XCTAssertTrue(sut.body is ProgressView)
    }
    
    func testAddFoodView_ErrorState() throws {
        let vm = AddFoodViewModel()
        vm.state = .error("An error occurred")
        
        let sut = AddFoodView(index: 0, mealTime: "Breakfast", vm: vm)
        
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.vm.state, .error("An error occurred"))
        XCTAssertNotNil(sut.body)
        XCTAssertTrue(sut.body is ProgressView)
    }
    
    func testAddFoodView_SuccessState() throws {
        let food = Food(name: "Eggs", calories: 150)
        let foods = [[food]]
        let vm = AddFoodViewModel()
        vm.state = .success(foods)
        
        let sut = AddFoodView(index: 0, mealTime: "Breakfast", vm: vm)
        
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.vm.state, .success([[food]]))
        XCTAssertNotNil(sut.body)
        XCTAssertTrue(sut.body is VStack)
    }
}



