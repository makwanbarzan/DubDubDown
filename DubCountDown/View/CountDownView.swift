//
//  CountDownView.swift
//  DubCountDown
//
//  Created by Makwan BK on 5/10/20.
//  Copyright © 2020 Makwan BK. All rights reserved.
//

import SwiftUI

struct CountDownView: View {
    
    var month = 0
    var day = 0
    var hour = 0
    var minute = 0
    var second = 0
    
    var body: some View {
        
        ZStack {
            Color.black
            
            HStack {
                
                VStack(alignment: .center) {
                    Text("\(self.month)")
                        .font(.custom("AppleSDGothicNeo-Medium", size: 44))
                        
                        .foregroundColor(.white)
                    
                    Text(self.month > 1 ? "Months" : "Month")
                        .font(.custom("AppleSDGothicNeo-Light", size: 17))
                        .foregroundColor(.white)
                }
                .padding(5)
                
                
                VStack(alignment: .center) {
                    Text("\(self.day)")
                        .font(.custom("AppleSDGothicNeo-Medium", size: 44))
                        .foregroundColor(.white)
                        
                    
                    Text(self.day > 1 ? "Days" : "Day")
                        .font(.custom("AppleSDGothicNeo-Light", size: 17))
                        .foregroundColor(.white)
                }
                .padding(5)
                
                
                VStack(alignment: .center) {
                    Text("\(self.hour)")
                        .font(.custom("AppleSDGothicNeo-Medium", size: 44))
                        .foregroundColor(.white)
                    
                    Text(self.hour > 1 ? "Hours" : "Hour")
                        .font(.custom("AppleSDGothicNeo-Light", size: 17))
                        .foregroundColor(.white)
                }
                .padding(5)
                
                
                VStack(alignment: .center) {
                    Text("\(self.minute)")
                        .font(.custom("AppleSDGothicNeo-Medium", size: 44))
                        .foregroundColor(.white)
                    
                    Text(self.minute > 1 ? "Minutes" : "Minute")
                        .font(.custom("AppleSDGothicNeo-Light", size: 17))
                        .foregroundColor(.white)
                }
                .padding(5)
                
                
                VStack(alignment: .center) {
                    Text("\(self.second)")
                        .font(.custom("AppleSDGothicNeo-Medium", size: 44))
                        .foregroundColor(.white)
                    
                    Text(self.second > 1 ? "Seconds" : "Second")
                        .font(.custom("AppleSDGothicNeo-Light", size: 17))
                        .foregroundColor(.white)
                }
                .padding(5)
                
            }
        .lineLimit(1)
        }
    
    }
}

struct CountDownView_Previews: PreviewProvider {
    static var previews: some View {
        CountDownView()
    }
}
