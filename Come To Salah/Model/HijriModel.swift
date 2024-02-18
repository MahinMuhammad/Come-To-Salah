//
//  HijriModel.swift
//  Come To Salah
//
//  Created by Md. Mahinur Rahman on 2/18/24.
//

import Foundation

struct HijriModel:Decodable{
    let date:String
    let day:String
    let weekday:Weekday
}

struct Weekday:Decodable{
    let en:String
}
