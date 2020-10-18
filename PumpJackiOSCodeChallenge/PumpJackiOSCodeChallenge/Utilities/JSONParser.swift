//
//  APIHandler.swift
//  PumpJackiOSCodeChallenge
//
//  Created by Myrline Sylveus on 10/17/20.
//  Copyright © 2020 myrline. All rights reserved.
//

import UIKit

struct JSONParser {
    
    /// Responsible for parsing JSON
    /// - Parameter fileName: name of JSON file
    func loadJson(filename fileName: String) -> [Gl]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Root.self, from: data)
                return jsonData.pl?.gl
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
