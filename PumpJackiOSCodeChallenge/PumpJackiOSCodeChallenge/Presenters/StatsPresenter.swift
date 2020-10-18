//
//  StatsPresenter.swift
//  PumpJackiOSCodeChallenge
//
//  Created by Myrline Sylveus on 10/17/20.
//  Copyright © 2020 myrline. All rights reserved.
//

import UIKit

struct StatsPresenter {
   
    /*
     This function gets the json data, sets to a new dictionary.
     New dictionary is set to match UI data.
     */
    func getStatsInfo() -> StatsInfo {
        let info = StatsInfo()
        
        if let myGl = JSONParser().loadJson(filename: "Stats_sample_1") {
            info.statsGl = myGl
        }
        
        //Values with date as Key, and data as value in an array
        for g in info.statsGl {
            if let date = g.gdte {
                info.statsDict[date] = g.statsValues()
            }
        }
        
        //sorting in descending
        info.keysArray = info.statsDict.keys.sorted(by: { (s1, s2) -> Bool in
            return s2 < s1
        })
        info.keysArray.insert("Date", at: 0)
        
        //To get header
        info.statsDict["Date"] = ["min", "fga", "fgm", "tpa","tpm","fta","ftm","oreb","dreb","reb", "ast",
                            "stl", "blk","tov","pf","pts","pm"]
        
        return info
        
    }
    
}
