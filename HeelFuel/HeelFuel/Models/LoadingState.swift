//
//  LoadingState.swift
//  HeelFuel
//
//  Created by William Wang on 9/1/25.
//

import Foundation

enum LoadingState {
    case idle
    case success([[Food]])
    case loading
    case error(String)
}
