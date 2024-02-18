//
//  TimeViewModel.swift
//  Come To Salah
//
//  Created by Md. Mahinur Rahman on 2/18/24.
//

import Foundation

final class TimeViewModel:ObservableObject{
    @Published var calendar:[DataModel] = [] //everyday data
    
    let networkManager = NetworkManager()
    
    func loadMonth(){
        networkManager.fetchData(year: "2024", month: "2", source: "2", lat: "23.777176", lon: "90.399452") { data, error in
            if error == nil{
                if data.count > 0{
                    self.calendar = data
                }
            }
        }
    }
    
    func getToday()->Int{
        return Int(Date().formatted(Date.FormatStyle().day(.defaultDigits))) ?? 1
    }
}
