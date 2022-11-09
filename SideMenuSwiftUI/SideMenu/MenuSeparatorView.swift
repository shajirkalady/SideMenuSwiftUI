//
//  MenuSeperatorView.swift
//  SideMenuSwiftUI
//
//  Created by Shajir Kalady on 11/9/22.
//

import SwiftUI

struct MenuSeperatorView: View {
    
    var body: some View {
        Rectangle()
            .foregroundColor(.gray)
            .frame(height: 1)
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .padding(.top, 20)
    }
    
}
