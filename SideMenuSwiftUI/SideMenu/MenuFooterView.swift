//
//  MenuFooterView.swift
//  SideMenuSwiftUI
//
//  Created by Shajir Kalady on 11/9/22.
//

import SwiftUI

struct MenuFooterView: View {
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .foregroundColor(.black)
                    .frame(width: 50)
                    .imageScale(.large)
                Text("Logout")
                    .foregroundColor(.black)
                    .font(.system(size: 16))
                    .fontWeight(.heavy)
                Spacer()
            }
            .onTapGesture {
                print("logout")
            }
        }
    }
    
}
