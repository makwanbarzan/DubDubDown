//
//  ContentView.swift
//  WatchOS Version Extension
//
//  Created by Makwan BK on 5/10/20.
//  Copyright © 2020 Makwan BK. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var month = 0
    @State private var day = 0
    @State private var hour = 0
    @State private var minute = 0
    @State private var second = 0
    
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 40)
                    .padding(25)
                
                Spacer()
                
                CountDownWatchView(month: self.month, day: self.day, hour: self.hour, minute: self.minute, second: self.second)
                
                Spacer()
            }
        }
        .onReceive(timer) { time in
            
            self.month = self.countdown.month!
            self.day = self.countdown.day!
            self.hour = self.countdown.hour!
            self.minute = self.countdown.minute!
            self.second = self.countdown.second!
            
        }
    }
    
    var originalDate: Date {
        let original = DateComponents(
            year: 2020,
            month: 6,
            day: 22,
            hour: 20,
            minute: 0,
            second: 0
        )
        
        return Calendar.current.date(from: original)!
    }
    
    var countdown: DateComponents {
        
        var cal = Calendar.current.dateComponents([.month, .day, .hour, .minute, .second], from: Date(), to: originalDate)
        cal.timeZone = TimeZone(identifier: "UTC")!
        
        return cal
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
