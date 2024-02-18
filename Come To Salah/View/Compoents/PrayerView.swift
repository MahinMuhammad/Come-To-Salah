//
//  PrayerView.swift
//  Come To Salah
//
//  Created by Md. Mahinur Rahman on 2/18/24.
//

import SwiftUI

struct PrayerView: View {
    let name:String
    let time:String
    let icon:String
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(name)
                    .font(.title2)
                Text(time)
                    .font(.callout)
            }
            Spacer()
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 40)
        }
        .padding(.bottom)
        .padding(.top)
        .listRowBackground(Color(K.CustomColors.primaryColor))
    }
}
