//
//  DetailItemsView.swift
//  DubCountDown
//
//  Created by Makwan BK on 5/11/20.
//  Copyright © 2020 Makwan BK. All rights reserved.
//

import SwiftUI

struct DetailItemsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "calendar")
                    .foregroundColor(.white)
                
                Text("June 22, 2020")
                    .font(.custom("AppleSDGothicNeo-Medium", size: 17))
                    .foregroundColor(.white)
            }
            
            HStack {
               Image(systemName: "location.circle")
                    .foregroundColor(.white)
                
                Text("Online")
                    .font(.custom("AppleSDGothicNeo-Medium", size: 17))
                    .foregroundColor(.white)
            }
            
            HStack {
                Image(systemName: "safari")
                    .foregroundColor(.white)
                
                Button("Open Website") {
                    UIApplication.shared.open(URL(string: "https://developer.apple.com/wwdc20/")!)
                }
                    .font(.custom("AppleSDGothicNeo-Medium", size: 17))
                    .foregroundColor(.blue)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(10)
    }
}

struct DetailItemsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailItemsView()
    }
}
