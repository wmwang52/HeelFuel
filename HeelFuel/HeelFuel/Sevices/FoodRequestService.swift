//
//  foodRequestService.swift
//  HeelFuel
//
//  Created by Milan Dutta on 4/14/23.
//

//MARK: Fetches all the food data from the backend

import Foundation

struct foodRequestService {
    var session = URLSession.shared
    var decoder = JSONDecoder()

    func requestFoods() async throws -> [[Food]] {
        let components = URLComponents(string: "https://foodforthought-741c2-default-rtdb.firebaseio.com/ChaseMenu.json")

        guard let url = components?.url else {
            fatalError("URL IS INVALID - FatalError")
        }
        let (data, _) = try await session.data(from: url)

        let Foods = try decoder.decode([[Food]].self, from: data)

        return Foods
    }
}
