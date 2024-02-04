//
//  App.swift
//  App Store
//
//  Created by Arkar on 04/02/2024.
//

import Foundation
import UIKit
import SwiftyJSON


struct App{
    let name : String
    let id : String
    let artistName : String
    let artworkUrl100 : String
    
    init(json:JSON){
        name = json["name"].stringValue
        id = json["id"].stringValue
        artistName = json["artistName"].stringValue
        artworkUrl100 = json["artworkUrl100"].stringValue
        
    }
}
