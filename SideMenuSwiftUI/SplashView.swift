//
//  SplashView.swift
//  SideMenuSwiftUI
//
//  Created by Shajir Kalady on 11/8/22.
//

import SwiftUI

struct SplashView: View {
    @State var loadHome = false
    var body: some View {
        VStack {
            Text("SplashView")
                .font(.title)
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.loadHome = true
            }
        }
        .fullScreenCover(isPresented: $loadHome) {
            HomeView()
        }
        .padding()
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
