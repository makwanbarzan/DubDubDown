//
//  CountDownWatchView.swift
//  WatchOS Version Extension
//
//  Created by Makwan BK on 5/11/20.
//  Copyright © 2020 Makwan BK. All rights reserved.
//

import SwiftUI

struct CountDownWatchView: View {
    
    var month = 0
    var day = 0
    var hour = 0
    var minute = 0
    var second = 0
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("\(self.month)")
                        .font(.custom("AppleSDGothicNeo-Medium", size: 24))
                    
                    Text(self.month > 1 ? "Months" : "Month")
                        .font(.custom("AppleSDGothicNeo-Medium", size: 13))
                }
                
                VStack {
                    Text("\(self.day)")
                        .font(.custom("AppleSDGothicNeo-Medium", size: 24))
                    
                    Text(self.day > 1 ? "Days" : "Day")
                        .font(.custom("AppleSDGothicNeo-Medium", size: 13))
                }
                
                VStack {
                    Text("\(self.hour)")
                        .font(.custom("AppleSDGothicNeo-Medium", size: 24))
                    
                    Text(self.hour > 1 ? "Hours" : "Hour")
                        .font(.custom("AppleSDGothicNeo-Medium", size: 13))
                }
            }
            .padding(.bottom)
            
            HStack {
                
                VStack {
                    Text("\(self.minute)")
                        .font(.custom("AppleSDGothicNeo-Medium", size: 24))
                    
                    Text(self.minute > 1 ? "Minutes" : "Minute")
                        .font(.custom("AppleSDGothicNeo-Medium", size: 13))
                    
                }
                
                VStack {
                    Text("\(self.second)")
                        .font(.custom("AppleSDGothicNeo-Medium", size: 24))
                    
                    Text(self.second > 1 ? "Seconds" : "Second")
                        .font(.custom("AppleSDGothicNeo-Medium", size: 13))
                    
                }
            }
            .padding(.top)
            
            Spacer()
        }
    }
}

struct CountDownWatchView_Previews: PreviewProvider {
    static var previews: some View {
        CountDownWatchView()
    }
}
