//
//  TimeView.swift
//  Come To Salah
//
//  Created by Md. Mahinur Rahman on 2/17/24.
//

import SwiftUI

struct TimeView: View {
    @ObservedObject var viewModel:TimeViewModel
    
    var body: some View {
        if viewModel.calendar.count > 0{
            let today = viewModel.calendar[viewModel.getToday()-1]
            ZStack {
                Color(K.CustomColors.secondaryColor)
                    .ignoresSafeArea()
                VStack{
                    HStack{
                        VStack(alignment:.leading){
                            Text("Dhaka, Bangladesh")
                                .font(.title2)
                            let hijriFormat = today.date.hijri
                            let hijriDate = hijriFormat.day+" "+hijriFormat.month.en+" "+hijriFormat.year
                            Text(today.date.readable+" | "+hijriDate)
                            
                        }
                        Spacer()
                        Image(systemName: "location.north.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                    }
                    .padding()
                    
                    List(0..<5){_ in
                        PrayerView(name: "Fajr", time: today.timings.Fajr, icon: "sun.horizon")
                        PrayerView(name: "Dhuhr", time: today.timings.Dhuhr, icon: "sun.max")
                        PrayerView(name: "Asr", time: today.timings.Asr, icon: "sun.haze")
                        PrayerView(name: "Maghrib", time: today.timings.Maghrib, icon: "sunset")
                        PrayerView(name: "Isha", time: today.timings.Isha, icon: "moon")
                    }
                    .listStyle(.plain)
                    .scrollDisabled(true)
                }
                .padding()
            }
        }
    }
}

#Preview {
    TimeView(viewModel:TimeViewModel())
}
