//
//  MenuHeaderView.swift
//  SideMenuSwiftUI
//
//  Created by Shajir Kalady on 11/9/22.
//

import SwiftUI

struct MenuHeaderView: View {
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Menu title")
                        .foregroundColor(.black)
                        .font(.system(size: 12))
                        .fontWeight(.light)
                        .padding(.leading, 20)
                        .padding(.top, 64)
                    
                    Button {
                        print("Button click")
                    } label: {
                        HStack{
                            Text("Notifications")
                                .foregroundColor(.black)
                                .font(.system(size: 14))
                                .fontWeight(.bold)
                                .padding(.leading, 20)
                                .padding(.top, 4)
                                .underline()
                            Text("(2)")
                                .foregroundColor(.red)
                                .font(.system(size: 14))
                                .fontWeight(.bold)
                                .padding(.leading, -5)
                                .padding(.top, 4)
                        }
                    }
                }
                
                Spacer()
                
                Button {
                    print("Settings Button click")
                } label: {
                    HStack{
                        Image(systemName: "gearshape")
                            .foregroundColor(.black)
                            .padding(.trailing, 10)
                            .padding(.top, 64)
                            .imageScale(.large)
                    }
                }
            }
        }
    }
    
}
