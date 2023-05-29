//
//  ContentView.swift
//  NetworkTesting
//
//  Created by Athoya on 17/05/23.
//

import SwiftUI

struct ContentView: View {
    var service: NetworkService = NetworkService()
    @State var imageUrl: String = ""
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: imageUrl), content: { image in
                image.resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipped()
            }, placeholder: {
                ProgressView()
            })
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            Text("Hello, world!")
        }
        .padding()
        .task {
            do {
                let user = try await service.getUser()
                imageUrl = user.image
            } catch {
                print(error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
