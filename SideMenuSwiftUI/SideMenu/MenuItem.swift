//
//  MenuItem.swift
//  SideMenuSwiftUI
//
//  Created by Shajir Kalady on 11/8/22.
//

import SwiftUI

struct MenuItem: View {
    var menuItem: [String:String]
    
    var body: some View {
        HStack{
            Image(systemName: menuItem["image"]!)
                .foregroundColor(.black)
                .frame(width: 50)
                .imageScale(.large)
            
            Text(menuItem["name"]!)
                .foregroundColor(.black)
                .font(.system(size: 20))
                .fontWeight(.heavy)
            
            Spacer()
        }
        .padding(10)
    }
}
