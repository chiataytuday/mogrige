//
//  MovieListTableViewController.swift
//  PreapareExample
//
//  Created by Hyunseok Yang on 2020/10/04.
//

import UIKit

struct  Movie {
    var title:String
    var date:String
    var image:String
}


class MovieListTableViewController: UITableViewController {
    
    var movieList = [
        Movie(title: "테스와 보낸 여름", date:"2020.09.10", image: ""),
        Movie(title: "담보", date: "", image: ""),
        Movie(title: "국제수사", date: "2020.09.10", image: ""),
        Movie(title: "검객", date: "2020.09.11", image: ""),
        Movie(title: "테넷", date: "2020.08.31", image: ""),
        Movie(title: "그린랜드", date: "2020.09.11", image: ""),
        Movie(title: "죽지않는 인간들의 밤", date: "", image: ""),
        Movie(title: "뮬란", date: "2020.09.11", image: ""),
        Movie(title: "디바", date: "2020.09.12", image: ""),
        Movie(title: "아웃포스트", date: "2020.09.15", image: "")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movieList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)

        cell.textLabel?.text = (movieList[indexPath.row].title)
        cell.detailTextLabel?.text = (movieList[indexPath.row].date)
        // cell.imageView?.image = UIImage(movieList[indexPath.row].image)

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
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
