//
//  ViewController.swift
//  TheMobieApp
//
//  Created by Rafael Santana on 3/23/19.
//  Copyright © 2019 Rafael Santana. All rights reserved.
//

import UIKit
import AlamofireImage
class ViewController: UIViewController , UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
  
        return movies.count;
        //return 50;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier:"MovieCell") as! MovieCell;
        
        let movie = movies[indexPath.row];
        let title = movie["title"] as! String;
                let over = movie["overview"] as! String;
        //cell.textLabel?.text = title;
        print(over)
        cell.title.text = title;
        cell.summary.text = over;
        
        
        let baseUrl = "https://image.tmdb.org/t/p/w185";
        let posterUrl = movie["poster_path"] as! String;
        let full_url = URL (string: baseUrl + posterUrl);
        
        cell.poster.af_setImage(withURL: full_url! )
        
        return cell;
    }
    

    @IBOutlet weak var myTable: UITableView!
     var movies = [[String: Any]]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.dataSource = self;
        myTable.delegate = self;
        // Do any additional setup after loading the view, typically from a nib.
    
    
       
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                
            
               self.movies = dataDictionary["results"] as! [[String: Any]] //swift uses self as suppouse to this
               
              self.myTable.reloadData();
                
                // TODO: Get the array of movies
                // TODO: Store the movies in a property to use elsewhere
                // TODO: Reload your table view data
           //     print(dataDictionary );
            
            }
        }
        task.resume()
    

        
        
        
    }


}

