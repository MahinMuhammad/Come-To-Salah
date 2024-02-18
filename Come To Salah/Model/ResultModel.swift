//
//  CalendarModel.swift
//  Come To Salah
//
//  Created by Md. Mahinur Rahman on 2/18/24.
//

import Foundation

struct ResultModel:Decodable{
    let data: [DataModel]
}

struct DataModel:Decodable, Identifiable{
    var id:String{
        return date.timestamp
    }
    let timings:TimingsModel
    let date:DateModel
    let meta:MetaDataModel
}

struct TimingsModel:Decodable{
    let Fajr:String
    let Dhuhr:String
    let Asr:String
    let Maghrib:String
    let Isha:String
}

struct MetaDataModel:Decodable{
    let timezone:String
}
