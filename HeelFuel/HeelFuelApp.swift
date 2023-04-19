//
//  HeelFuelApp.swift
//  HeelFuel
//
//  Created by Milan Dutta on 4/10/23.
//

import SwiftUI

@main
struct HeelFuelApp: App {
    @StateObject var vm: CDDataModel = CDDataModel()
    var body: some Scene {
        WindowGroup {
            ContentView().preferredColorScheme(.light)
        }
    }
}
