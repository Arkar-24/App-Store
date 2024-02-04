//
//  AppViewController.swift
//  App Store
//
//  Created by Arkar on 04/02/2024.
//

import UIKit

class AppViewController: UIViewController{
   
    
    @IBOutlet weak var appTableView : UITableView!
    @IBOutlet weak var activityIndicator : UIActivityIndicatorView!
    
    var allApps = [App]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        NetworkManager.shared.FetchDataFromAPI{
            results in
            self.activityIndicator.stopAnimating()
            self.allApps = results
            self.appTableView.reloadData()
        }
    }
}
extension AppViewController:UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allApps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = appTableView.dequeueReusableCell(withIdentifier: "AppTableViewCell", for: indexPath)as! AppTableViewCell
        let app = allApps[indexPath.row]
        cell.appNameLabel.text = app.name
        cell.appCompamyLabel.text = app.artistName
        
        if let imageURL = URL(string: app.artworkUrl100){
            let imageData = try? Data(contentsOf: imageURL)
            cell.appImage.image = UIImage(data: imageData!)
            cell.appImage.layer.cornerRadius = 15
            cell.appImage.layer.shadowOpacity = 0.3
            cell.appImage.layer.shadowOffset =  CGSize(width: 8, height: 10)
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
}
