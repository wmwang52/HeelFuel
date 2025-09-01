//
//  LoadingState.swift
//  HeelFuel
//
//  Created by William Wang on 9/1/25.
//

import Foundation

enum LoadingStateModel {
    case idle
    case success([[FoodModel]])
    case loading
    case error(String)
}
