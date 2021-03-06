//
//  KeywordListViewController.swift
//  mogrige
//
//  Created by Taylor Hyobeen Moon on 2020/10/25.
//

import UIKit

//필수 프로토콜 추가(dataSource, Delegate)
class KeywordListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    var filteredData:[String] = []
    var keywordsData:[String] = []
    let cellIdentifier: String = "cell"
    let customCellIdentifier: String = "customCell"
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var keywordListTableView: UITableView!
    @IBOutlet weak var boardTotalNum: UILabel!
    
    @IBAction func closeModal(
            _ segue: UIStoryboardSegue) {
        }
    
    //
    
    //Cell 높이 조절
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    // tableView 열 세팅
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    // tableView 세팅
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    // tableView에 데이터 입력
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! KeywordListTableViewCell
                
        let postListCell = filteredData[indexPath.row]
        
        //board 내 그림 번호 설정 > 삭제
        //cell.boardNum?.text = "Board #\(indexPath.row + 1)"
        
        //키워드로 타이틀 설정
        cell.keywordTitle?.text = postListCell

        return cell
    }
    
    //tableView 스와이프해서 삭제하기
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            Post_List.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            
            boardTotalNum.text = "총\(Post_List.count)개의 보드"
        }
        
    }
    
    //기본 세팅
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        for item in Post_List {
            keywordsData.append(item.keywords)
        }
        
        filteredData = keywordsData

    }
    
    override func viewWillAppear(_ animated: Bool) {
        boardTotalNum.text = "총 \(Post_List.count)개의 보드"
    }
    
    //검색바 config
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = []
        
        if searchText == "" {
            filteredData = keywordsData
        } else {
            for keyword in keywordsData {

                if keyword.lowercased().contains(searchText.lowercased()) {
                    filteredData.append(keyword)
                }
            }
        }
        self.keywordListTableView.reloadData()
        
    }
    
    /*
    public protocol UITableViewDataSource : NSObjectProtocol {

        
        @available(iOS 2.0, *)
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Post_List.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! KeywordListTableViewCell
        
        
        return cell
        }
     */
    
    //TableView 수동설정
    /*
    let listTableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor.white
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorColor = UIColor.white
        return tv
    }()
    */
    
    
    
    
    /*
    func setupTableView() {
        listTableView.register(UITableViewCell.self, forCellReuseIdentifier: "customCell")
        listTableView.delegate = self
        listTableView.dataSource = self
        
        view.addSubview(listTableView)
            
        NSLayoutConstraint.activate([
            listTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            listTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            listTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            listTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
        
        listTableView.register(KeywordListTableViewCell.self, forCellReuseIdentifier: "customCell")
    }
    */
}
