//
//  WebSitesViewController.swift
//  Project4
//
//  Created by Fırat Kahvecioğlu on 24.07.2022.
//

import UIKit

class WebSitesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
  
    
    var websites = ["hackingwithswift.com", "apple.com","spacex.com","github.com","twitter.com","youtube.com"]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            title = "🏄 Surf The Web 🏄"
            navigationController?.navigationBar.prefersLargeTitles = true
            tableView.delegate = self
            tableView.dataSource = self
        }
        
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            websites.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Website", for: indexPath)
            cell.textLabel?.text = websites[indexPath.row]
            return cell
        }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "WebView") as? ViewController{
                vc.selectedWebsite = websites[indexPath.row]
                vc.websites = websites
                navigationController?.pushViewController(vc, animated: true)
            }
        }
}
