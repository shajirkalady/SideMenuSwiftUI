//
//  VideosView.swift
//  SideMenuSwiftUI
//
//  Created by Shajir Kalady on 11/8/22.
//

import SwiftUI

struct VideosView: View {
    @State private var isSideBarVisible = false
    var body: some View {
        ZStack{
            NavigationView{
                VStack {
                    Text("VideosView")
                        .font(.title)
                }
                .padding()
                .navigationTitle("VideosView")
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

struct VideosView_Previews: PreviewProvider {
    static var previews: some View {
        VideosView()
    }
}
