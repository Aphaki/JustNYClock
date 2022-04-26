//
//  ContentView.swift
//  JustNYClock
//
//  Created by Sy Lee on 2022/04/26.
//

import SwiftUI

struct ContentView: View {
    var timer = Timer.publish(every: 1.0, on: .main, in: .default).autoconnect()
    
    let formatter: DateFormatter = {
        let df = DateFormatter()
        df.timeZone = TimeZone(identifier: "America/New_York")
        df.locale = Locale(identifier: "ko_KR")
        df.dateStyle = .medium
        df.timeStyle = .medium
        return df
    }()
    @State var dateStr = "Loading..."
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.pink, .white], startPoint: .leading, endPoint: .trailing)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                Text("New_York Clock")
                    .fontWeight(.black)
                Text(dateStr)
                    .font(.title)
                    .fontWeight(.thin)
                    .onReceive(timer) { output in
                       let dateString = formatter.string(from: output)
                        self.dateStr = dateString
                }
            } //VStack
        } //ZStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
