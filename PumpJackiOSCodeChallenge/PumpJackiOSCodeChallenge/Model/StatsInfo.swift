//
//  StatsInfo.swift
//  PumpJackiOSCodeChallenge
//
//  Created by Myrline Sylveus on 10/18/20.
//  Copyright © 2020 myrline. All rights reserved.
//

import UIKit


/// This object is a representation of the UI
class StatsInfo: NSObject {
    var statsGl = [Gl]() //contains all data
    var statsDict = [String: [String]]() //key represents the Dates and value represents the stats
    var keysArray = [String]() //Sorted dates from the dictionary keys
}
