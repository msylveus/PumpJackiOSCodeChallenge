//
//  Gl.swift
//  PumpJackiOSCodeChallenge
//
//  Created by Myrline Sylveus on 10/17/20.
//  Copyright © 2020 myrline. All rights reserved.
//

import UIKit

class Gl: Codable {
    
    var gdte : String?
    
    var min : Int?
    var fga : Int?
    var fgm : Int?
    var tpa : Int?
    var tpm : Int?
    var fta : Int?
    var ftm : Int?
    var oreb : Int?
    var dreb : Int?
    var reb : Int?
    var ast : Int?
    var stl : Int?
    var blk : Int?
    var tov : Int?
    var pf : Int?
    var pts : Int?
    var pm : Int?
    
    
    /// This function is to be served as the value for each entry in a new dictionary
    /// - Returns: Array containing Stats data
    func statsValues() -> [String] {
        
        return ["\(min ?? 0)",
                "\(fga ?? 0)",
                "\(fgm ?? 0)",
                "\(tpa ?? 0)",
                "\(tpm ?? 0)",
                "\(fta ?? 0)",
                "\(ftm ?? 0)",
                "\(oreb ?? 0)",
                "\(dreb ?? 0)",
                "\(reb ?? 0)",
                "\(ast ?? 0)",
                "\(stl ?? 0)",
                "\(blk ?? 0)",
                "\(tov ?? 0)",
                "\(pf ?? 0)",
                "\(pts ?? 0)",
                "\(pm ?? 0)"]
    }
}
