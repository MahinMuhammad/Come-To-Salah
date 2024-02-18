//
//  ContentView.swift
//  Come To Salah
//
//  Created by Md. Mahinur Rahman on 2/17/24.
//

import SwiftUI

struct TabBarView: View {
    let timeViewModel = TimeViewModel()
    
    init(){
        UITabBar.appearance().backgroundColor = UIColor(named: K.CustomColors.primaryColor)
    }
    
    var body: some View {
        TabView {
            TimeView(viewModel: timeViewModel)
                .tabItem { Label("Time", systemImage: "clock") }
            SettingsView()
                .tabItem { Label("Settings", systemImage: "gearshape") }
        }
        .onAppear{
            self.timeViewModel.loadMonth()
        }
    }
}

#Preview {
    TabBarView()
}
