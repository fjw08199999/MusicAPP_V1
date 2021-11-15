//
//  SongTableViewController.swift
//  MusicAPP_V1
//
//  Created by fred fu on 2021/11/8.
//

import UIKit

class SongTableViewController: UITableViewController {
    
    var items = [StoreItem]()
    
    func updatCell() {
        let urlStr = "https://itunes.apple.com/search?term=swift&media=music"
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    do {
                        let searchResponse = try decoder.decode(SearchResponse.self, from: data)
                        self.items = searchResponse.results
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                        
                    } catch  {
                        print(error)
                    }
                }
            }.resume()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updatCell()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 0
    //    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(SongTableViewCell.self)", for: indexPath) as! SongTableViewCell
        
        let item = items[indexPath.row]
        cell.nameLabelOutlet.text = item.artistName
        cell.dataLabelOutlet.text = item.trackName
        
        URLSession.shared.dataTask(with: item.artworkUrl100) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    cell.smallPhotoImageOutlet.image = UIImage(data: data)
                    tableView.reloadData()
                    
                }
            }
        }.resume()
        
        return cell
    }
    
    @IBSegueAction func showDetailIBSegueAction(_ coder: NSCoder) -> SongDataViewController? {
        if let row = tableView.indexPathForSelectedRow?.row {
            return SongDataViewController(coder: coder, item: items[row])
        } else {
            return nil
        }
        
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tablieView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
