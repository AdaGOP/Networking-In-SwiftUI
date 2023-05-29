//
//  ContentViewModel.swift
//  NetworkTesting
//
//  Created by Athoya on 17/05/23.
//

import Foundation

class NetworkService {
    var endPoint = "https://raw.githubusercontent.com/athoya/dummy-json-server/main/"
    
    var session = URLSession.shared
    
    func getUser() async throws -> User {
        let request = URLRequest(url: URL(string: endPoint + "user.json")!)
        let (data, response) = try await session.data(for: request)
        let decoder = JSONDecoder()
        let user = try decoder.decode(User.self, from: data)
        return user
    }
}
