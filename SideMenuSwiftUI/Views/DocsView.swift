//
//  DocsView.swift
//  SideMenuSwiftUI
//
//  Created by Shajir Kalady on 11/8/22.
//

import SwiftUI

struct DocsView: View {
    @State private var isSideBarVisible = false
    var body: some View {
        ZStack{
            NavigationView{
                VStack {
                    Text("DocsView")
                        .font(.title)
                }
                .padding()
                .navigationTitle("DocsView")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            isSideBarVisible.toggle()
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(.black)
                                .padding(.leading, 10)
                        }
                    }
                }
            }
            SideMenu(isSideBarVisible: $isSideBarVisible)
        }
    }
}

struct DocsView_Previews: PreviewProvider {
    static var previews: some View {
        DocsView()
    }
}
