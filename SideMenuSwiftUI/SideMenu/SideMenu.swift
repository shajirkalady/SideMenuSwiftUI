//
//  SideMenu.swift
//  SideMenuSwiftUI
//
//  Created by Shajir Kalady on 11/8/22.
//

import SwiftUI

struct SideMenu: View {
    @Binding var isSideBarVisible: Bool
    var menuItems = [["name": "Home", "image": "house"],
                     ["name": "Photos", "image": "photo.on.rectangle"],
                     ["name": "Videos", "image": "film.stack"],
                     ["name": "Contacts", "image": "person.2"],
                     ["name": "Documents", "image": "doc.text"]]
    var sideBarwidth = UIScreen.main.bounds.size.width * 0.8
    @State var menuItemSelected: [String:String]? = nil
    @State var onTapped = false
    
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
            content
        }
    }
    
    var content: some View {
        HStack(alignment: .top) {
            ZStack(alignment: .top) {
                Color.white
                VStack{
                    menuHeader
                    menuSeparator
                    
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
                    menuFooter
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
    
    var menuHeader: some View {
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
    
    var menuSeparator: some View {
        Rectangle()
            .foregroundColor(.gray)
            .frame(height: 1)
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .padding(.top, 20)
    }
    
    var menuFooter: some View {
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

