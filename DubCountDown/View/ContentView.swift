 //
 //  ContentView.swift
 //  DubCountDown
 //
 //  Created by Makwan BK on 5/10/20.
 //  Copyright © 2020 Makwan BK. All rights reserved.
 //
 
 import SwiftUI
 import UserNotifications
 
 struct ContentView: View {
    
    @State private var month = 0
    @State private var day = 0
    @State private var hour = 0
    @State private var minute = 0
    @State private var second = 1
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var showingEndLabel = false
    @State var switchRemindBackgroundColor = false
    
    var body: some View {
        GeometryReader { geo in
            
            ZStack {
                Color.black
                
                VStack {
                    
                    Image(decorative: "logo")
                        .padding(50)
                    
                    
                    CountDownView(month: self.month, day: self.day, hour: self.hour, minute: self.minute, second: self.second)
                    
                    
                    HStack {
                        Image(systemName: "bell")
                        Button("Remind Me") {
                            
                            self.switchRemindBackgroundColor.toggle()
                            
                            if self.switchRemindBackgroundColor == false {
                                UIApplication.shared.unregisterForRemoteNotifications()
                                
                                print("Remove Notifcation Register")
                            } else {
                                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                                    if success {
                                        self.sendPushNotification()
                                    } else if let error = error {
                                        print(error.localizedDescription)
                                    }
                                }
                                 print("Add Notifcation Register")
                            }
                            
                        }
                    }
                    .frame(width: 140, height: 35)
                    .font(.custom("AppleSDGothicNeo-Medium", size: 18))
                    .background(self.switchRemindBackgroundColor ? Color.green : Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.bottom)
                    
                    
                    if self.showingEndLabel {
                        Text("WWDC20 is Started!")
                            .font(.system(size: 34))
                            .foregroundColor(.white)
                    } else {
                         DetailItemsView()
                    }

                    
                    Text("Ready. Set. Code.")
                        .font(.title).fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding(.top)
                    
                    Image(decorative: "BC")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                }
            }
        }
        .onReceive(timer) { time in
            
            
            if self.month == 0 && self.day == 0 && self.hour == 0 && self.minute == 0 && self.second == 0 {
                
                self.showingEndLabel = true
                self.timer.upstream.connect().cancel()
                
            } else {
                self.month = self.countdown.month!
                self.day = self.countdown.day!
                self.hour = self.countdown.hour!
                self.minute = self.countdown.minute!
                self.second = self.countdown.second!
            }
            
        }
        .edgesIgnoringSafeArea(.all)
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
    
    func sendPushNotification() {
        
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "WWDC20 is Started"
        content.body = "Go watch it!"
        content.sound = UNNotificationSound.default
        
        var dateComp = DateComponents()
        dateComp.month = 6
        dateComp.day = 22
        dateComp.hour = 20
        dateComp.minute = 0
        dateComp.second = 0
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComp, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        center.add(request)
    }
    
    
 }
 
 struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
 }
