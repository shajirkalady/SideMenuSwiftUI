//
//  MenuContentView.swift
//  SideMenuSwiftUI
//
//  Created by Shajir Kalady on 11/9/22.
//

import SwiftUI

struct MenuContentView: View {
    @Binding var isSideBarVisible: Bool
    var sideBarwidth = UIScreen.main.bounds.size.width * 0.8
    var menuItems = [["name": "Home", "image": "house"],
                     ["name": "Photos", "image": "photo.on.rectangle"],
                     ["name": "Videos", "image": "film.stack"],
                     ["name": "Contacts", "image": "person.2"],
                     ["name": "Documents", "image": "doc.text"]]
    @State var menuItemSelected: [String:String]? = nil
    @State var onTapped = false

    var body: some View {
        HStack(alignment: .top) {
            ZStack(alignment: .top) {
                Color.white
                VStack{
                    MenuHeaderView()
                    MenuSeperatorView()
                    
                    ForEach (Array(menuItems.enumerated()), id: \.offset){ index, menuItem in
                        MenuItem(menuItem: menuItem).onTapGesture {
                            DispatchQueue.main.asyncAfter (deadline: .now() + 0.4)
                            {
                                UIView.setAnimationsEnabled(false)
                                self.onTapped.toggle()
                            }
                            self.menuItemSelected = menuItem
                            self.isSideBarVisible = false
                        }
                        .padding (0)
                    }
                    Spacer()
                    MenuFooterView()
                        .padding(.bottom, 30)
                        .padding(.leading, 20)
                }
                .fullScreenCover (isPresented: $onTapped) {
                    self.selected(menuItem: menuItemSelected)
                }
            }
            .frame (width: sideBarwidth)
            .offset(x: isSideBarVisible ? 0 : -sideBarwidth)
            .animation(.default, value: isSideBarVisible)
            Spacer ()
        }
        .onAppear {
            UIView.setAnimationsEnabled(true)
        }
    }
    
    func selected(menuItem: [String:String]?) -> some View {
        guard let menuItem = menuItem else {
            return AnyView(HomeView())
        }
        
        switch menuItem["name"] {
        case "Home":
            return AnyView(HomeView())
        case "Photos":
            return AnyView(PhotosView())
        case "Videos":
            return AnyView(VideosView())
        case "Contacts":
            return AnyView(ContactsView())
        case "Documents":
            return AnyView(DocsView())
        default:
            return AnyView(HomeView())
        }
    }

}
