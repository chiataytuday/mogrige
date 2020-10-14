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
        Movie(title: "담보", date: "2020.09.10", image: ""),
        Movie(title: "국제수사", date: "2020.09.10", image: ""),
        Movie(title: "검객", date: "2020.09.11", image: ""),
        Movie(title: "테넷", date: "2020.08.31", image: ""),
        Movie(title: "그린랜드", date: "2020.09.11", image: ""),
        Movie(title: "죽지않는 인간들의 밤", date: "2020.09.11", image: ""),
        Movie(title: "뮬란", date: "2020.09.11", image: ""),
        Movie(title: "디바", date: "2020.09.12", image: ""),
        Movie(title: "아웃포스트", date: "2020.09.15", image: "")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { let cell = sender as? UITableViewCell
//    let index = tableView.indexPath(for: cell)
//    // index.section, index.row
//    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let vc = segue.destination as? detailedViewController{
    //            vc.data = "Hello"
                if let cell = sender as? UITableViewCell,
                   let indexPath = tableView.indexPath(for: cell){
                    let selected = movieList[indexPath.row]
                    //Movie(title: "국제수사", date: "2020.09.10", image: ""),
                    
                   vc.data = selected.title
                    //국제수사
                    vc.data2 = selected.date
                    //2020.09.10
    //                vc.data = selected
                 }
            }
    }

}
