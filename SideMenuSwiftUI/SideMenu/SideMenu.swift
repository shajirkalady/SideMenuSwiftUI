//
//  SideMenu.swift
//  SideMenuSwiftUI
//
//  Created by Shajir Kalady on 11/8/22.
//

import SwiftUI

struct SideMenu: View {
    @Binding var isSideBarVisible: Bool
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(.black.opacity(0.5))
            .opacity(isSideBarVisible ? 1 : 0)
            .animation(.easeInOut.delay(0.2), value: isSideBarVisible)
            .onTapGesture {
                isSideBarVisible.toggle()
            }
            
            MenuContentView(isSideBarVisible: $isSideBarVisible)
        }
    }
}

