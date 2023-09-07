//
//  APIManager.swift
//  BatMobile_YouBikeTest
//
//  Created by 尹周舶 on 2023/8/30.
//

import Foundation
import UIKit

protocol APIManagerDelegate: AnyObject {
    func reloadData()
}

struct Station: Codable {
    let sna: String
    let sarea: String
    let ar: String
}


class APIManager {
    
    var textFieldString = ""
    var items = [Station]()
    var searchJasonArray: [Station] = []
    
    weak var delegate: APIManagerDelegate?
    
    // 一載入抓所有站點
    func fetchAPI() {
        let urlString = "https://tcgbusfs.blob.core.windows.net/dotapp/youbike/v2/youbike_immediate.json"
        
        if let url = URL(string: urlString) {
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                guard let data else { return }
                let decoder = JSONDecoder()
                do {
                    let station = try decoder.decode([Station].self, from: data)
                    self.items = station
                    DispatchQueue.main.async {
                        self.delegate?.reloadData()
                    }
                } catch {
                    print(error)
                }
            }.resume()
        }
    }
    
    // 搜尋依據 中山區 完整字串抓取
    func searchAPI() {
        //items.removeAll()
        searchJasonArray.removeAll()
        let urlString = "https://tcgbusfs.blob.core.windows.net/dotapp/youbike/v2/youbike_immediate.json"
        
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                guard let data else { return }
                let decoder = JSONDecoder()
                do {
                    let station = try decoder.decode([Station].self, from: data)
                    DispatchQueue.main.async {
                        for i in station {
                            if i.sarea == self.textFieldString  {
                                self.searchJasonArray.append(i)
                            }
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self.items = self.searchJasonArray
                        self.delegate?.reloadData()
                    }
                    
                } catch {
                    print(error)
                }
            }.resume()
        }
        
    }
    


}
