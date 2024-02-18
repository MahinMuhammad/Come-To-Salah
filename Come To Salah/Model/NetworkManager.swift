//
//  NetworkModel.swift
//  Come To Salah
//
//  Created by Md. Mahinur Rahman on 2/18/24.
//

import Foundation

final class NetworkManager{
    let urlString = "https://api.aladhan.com/v1/calendar/"
    
    func fetchData(year:String, month:String, source:String, lat:String, lon:String, completion: @escaping ([DataModel], Error?)->Void){
        let customUrlString = "\(urlString)\(year)/\(month)?latitude=\(lat)&longitude=\(lon)&method=\(source)"
        
        guard let url = URL(string: customUrlString) else{fatalError("Wrong url!")}
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let error{
                print("Failed to fetch data with error: \(error)")
                completion([], error)
            }else{
                let decoder = JSONDecoder()
                guard let data else{fatalError("Fetched data is nil")}
                
                do{
                    let result = try decoder.decode(ResultModel.self, from: data)
                    DispatchQueue.main.async {
                        print("Data fetched successfully!")
                        completion(result.data, nil)
                    }
                }catch{
                    print("Failed to decode data with error: \(error)")
                    completion([], error)
                }
            }
        }
        task.resume()
    }
}
