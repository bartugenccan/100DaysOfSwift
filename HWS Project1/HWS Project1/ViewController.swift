//
//  ViewController.swift
//  HWS Project1
//
//  Created by Bartu Gençcan on 19.01.2022.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl"){
                pictures.append(item)
            }
        }
        
        pictures.sort()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        
        cell.textLabel?.text = pictures[indexPath.row]
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let destinationVC = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            
            destinationVC.selectedImage = pictures[indexPath.row]
            destinationVC.totalPictures = pictures.count
            destinationVC.selectedPictureNumber = indexPath.row + 1
            
            navigationController?.pushViewController(destinationVC, animated: true)
            
        }
            
            
        
    }


}

