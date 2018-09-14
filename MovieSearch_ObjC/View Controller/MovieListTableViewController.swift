//
//  MovieListTableViewController.swift
//  MovieSearch_ObjC
//
//  Created by John Tate on 9/14/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var searchBar: UISearchBar!
    
    var movies: [JJTMovie]?
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.estimatedRowHeight = 200
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell
        let movie = movies?[indexPath.row]
        cell?.movie = movie
        return cell ?? UITableViewCell()
    }
}

extension MovieListTableViewController: UISearchBarDelegate {
 
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchText = searchBar.text else { return }
        
        JJTMovieController.fetchMovies(searchText) { (movies) in
            // set the array of movies returned by the search equal to the array of movies that is used as the table view data source
            self.movies = movies
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        
        // dismisses the keyboard
        searchBar.resignFirstResponder()
    }
}
