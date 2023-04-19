//
//  LoadingState.swift
//  HeelFuel
//
//  Created by Mitchell Anderson on 4/17/23.
//

import Foundation

enum LoadingState {
    case idle
    case success([[Food]])
    case loading
    case error(String)
}
