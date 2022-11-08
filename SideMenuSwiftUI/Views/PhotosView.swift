//
//  PhotosView.swift
//  SideMenuSwiftUI
//
//  Created by Shajir Kalady on 11/8/22.
//

import SwiftUI

struct PhotosView: View {
    @State private var isSideBarVisible = false

    var body: some View {
        ZStack{
            NavigationView{
                VStack {
                    Text("PhotosView")
                        .font(.title)
                }
                .padding()
                .navigationTitle("PhotosView")
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

struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosView()
    }
} 
