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
            ZStack {
                Color(K.CustomColors.secondaryColor)
                    .ignoresSafeArea()
                VStack{
                    HStack{
                        VStack(alignment:.leading){
                            Text("Dhaka, Bangladesh")
                                .font(.title2)
                            Text(viewModel.calendar[viewModel.getToday()].date.readable)
                            
                        }
                        Spacer()
                        Image(systemName: "location.north.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                    }
                    .padding()
                    
                    List(0..<5){_ in
                        HStack{
                            VStack(alignment: .leading){
                                Text("Asr")
                                    .font(.title2)
                                Text(viewModel.calendar[viewModel.getToday()].timings.Asr)
                                    .font(.callout)
                            }
                            Spacer()
                            Image(systemName: "sunrise")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40)
                        }
                        .padding(.bottom)
                        .padding(.top)
                        .listRowBackground(Color(K.CustomColors.primaryColor))
                        
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
