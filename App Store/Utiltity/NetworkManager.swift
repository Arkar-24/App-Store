//
//  NetworkManager.swift
//  App Store
//
//  Created by Arkar on 04/02/2024.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON


class NetworkManager{
    static let shared = NetworkManager()
    private init(){}
    func FetchDataFromAPI(completion:@escaping([App])->Void){
        let apiToContact = "https://rss.applemarketingtools.com/api/v2/mm/apps/top-free/20/apps.json"
        AF.request(URL(string:apiToContact) ?? "" ).responseJSON{[weak self]response in
            guard let self = self else {return}
            switch response.result{
            case .success(let data):
                let json = JSON(data)
                var allApps = [App]()
                let allAppsData = json["feed"]["results"].arrayValue
                print("results:",allAppsData)
                
                for appData in allAppsData{
                    let app = App(json: appData)
                    allApps.append(app)
                }
                completion(allApps)
                
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
}
