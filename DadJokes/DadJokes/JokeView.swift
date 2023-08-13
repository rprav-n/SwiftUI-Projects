//
//  ContentView.swift
//  DadJokes
//
//  Created by Praveen R on 13/08/23.
//

import SwiftUI

struct JokeView: View {
    
    @State var jokeString = "No Joke Available"
    @State var fetching = false
    @AppStorage("jokeType") var jokeType: JokeType = .dadjoke
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Image("StewartLynch")
                    .resizable()
                    .frame(width: 60, height: 60)
                VStack {
                    ForEach(JokeType.allCases, id: \.self) { item in
                        Button {
                            jokeType = item
                            Task {
                                await getJoke(jokeType.type)
                            }
                        } label: {
                            Text(item.rawValue)
                                .foregroundColor(item == jokeType ? .red : .primary)
                        }
                    }
                }
                .frame(height: 130)
            }
            if fetching {
                ProgressView()
            } else {
                Text(jokeString)
                    .minimumScaleFactor(0.5)
            }
            Spacer()
        }
        .padding()
        .task {
            await getJoke(jokeType.type)
        }
    }
    
    func getJoke(_ type: String) async {
        let url = "https://jokes.guyliangilsing.me/retrieveJokes.php?type=\(type)"
        let apiService = APIService(urlString: url)
        fetching.toggle()
        defer {
            fetching.toggle()
        }
        do {
            let joke: Joke = try await apiService.getJSON()
            jokeString = joke.joke
        } catch {
            jokeString = error.localizedDescription
        }
    }
}

struct JokeView_Previews: PreviewProvider {
    static var previews: some View {
        JokeView()
            .frame(width: 225, height: 225)
    }
}
