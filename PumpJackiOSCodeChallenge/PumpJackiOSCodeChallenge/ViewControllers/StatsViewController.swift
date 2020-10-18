//
//  ViewController.swift
//  PumpJackiOSCodeChallenge
//
//  Created by Myrline Sylveus on 10/17/20.
//  Copyright © 2020 myrline. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    @IBOutlet weak var statsCollectionView: UICollectionView!
    
    @IBOutlet weak var dateCollectionView: UICollectionView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var glData = [Gl]()
    var glDict = [String: [String]]()
    var keysArray = [String]()
    let numberOfSection = 17 //number of columns
    let cellHeight: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let info = StatsPresenter().getStatsInfo()
        
        glData = info.statsGl
        glDict = info.statsDict
        keysArray = info.keysArray
        
    } //end of viewDidLoad

}

extension StatsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(keysArray.count) * cellHeight
    }
}//end of TableView extension

extension StatsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView.tag == 1 {
            return 1
        }
        
        return numberOfSection
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print(keysArray.count)
        return keysArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DateCollectionViewCell", for: indexPath) as! DateCollectionViewCell
            
            cell.dateLabel.text = keysArray[indexPath.item]
            
            if indexPath.item == 0 {
                cell.backgroundColor = UIColor(red: 192.0/255.0, green: 250.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            } else if indexPath.item % 2 == 0 && indexPath.item != 0 {
                cell.backgroundColor = UIColor(red: 241.0/255.0, green: 241.0/255.0, blue: 241.0/255.0, alpha: 1.0)
            } else {
                cell.backgroundColor = UIColor.white
            }
            
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StatsCollectionViewCell", for: indexPath) as! StatsCollectionViewCell
            
            let key = keysArray[indexPath.item]
            
            if let stats = glDict[key] {
                let value: String? = stats[indexPath.section]
    
               cell.statsLabel.text = value
            } else {
                
                 cell.statsLabel.text = ""
            }
            
            if indexPath.item == 0 {
                cell.backgroundColor = UIColor(red: 192.0/255.0, green: 250.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            } else if indexPath.item % 2 == 0 && indexPath.item != 0 {
                cell.backgroundColor = UIColor(red: 241.0/255.0, green: 241.0/255.0, blue: 241.0/255.0, alpha: 1.0)
            } else {
                cell.backgroundColor = UIColor.white
            }
            
           return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if collectionView.tag == 1 {
            return CGSize(width: collectionView.bounds.size.width, height: cellHeight)

        } else {
           return CGSize(width: 70, height: cellHeight)

        }
    }
}
