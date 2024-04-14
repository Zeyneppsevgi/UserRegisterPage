//
//  movieListViewController.swift
//  mobillium-ios
//
//  Created by Zeynep Sevgi on 18.05.2023.
//

import UIKit

class MovieListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    let lists: [String] = ["Movie 1", "Movie 2", "Movie 3", "Movie 4", "Movie 5", "Movie 6", "Movie 7", "Movie 8", "Movie 9", "Movie 10"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = UIColor(red: 0.775, green: 1.0, blue: 0.988, alpha: 1.0)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    } 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor(red: 0.775, green: 1.0, blue: 0.989, alpha: 1.0)
        cell.textLabel?.text = lists[indexPath.row]
        cell.textLabel?.textColor = .darkGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie = lists[indexPath.row]
        let alertController = UIAlertController(title: "Movie Selected", message: selectedMovie, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
