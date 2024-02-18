//
//  DateModel.swift
//  Come To Salah
//
//  Created by Md. Mahinur Rahman on 2/18/24.
//

import Foundation

struct DateModel:Decodable{
    let readable:String
    let timestamp:String
    let hijri:HijriModel
}
