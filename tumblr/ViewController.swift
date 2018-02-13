//
//  ViewController.swift
//  tumblr
//
//  Created by ARG Lab on 1/31/18.
//  Copyright © 2018 ARG Lab. All rights reserved.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController , UITableViewDataSource{
    
    var posts : [[String: Any]] = []
    
    @IBOutlet weak var tableview: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableview.dataSource = self
        
        let tumblr_url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
        let tumblr_request = URLRequest(url: tumblr_url)
        let tumblr_session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = tumblr_session.dataTask(with: tumblr_request){
            data, response, error in
            if let error = error{
                print(error.localizedDescription)
            }else if let data = data{
                let  dict = try! JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
                
                let blogs = dict["response"] as! [String: Any]
                let posts = blogs["posts"] as! [[String: Any]]
                self.posts = posts
                
                self.tableview.reloadData()
                
                
                
            }
        }
        task.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let indexPath = tableview.indexPath(for: cell){
            let post = posts[indexPath.row]
            let detailVeiwController = segue.destination as! DetailViewController
            
            detailVeiwController.post = post
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "TumPic" , for: indexPath) as! TumCell
        
        let post = posts[ indexPath.row]
        

        let photos = post["photos"] as! [[String: Any]]
        let photo = photos[0]
        let type = photo["original_size"] as! [String: Any]
        let coverPath = type["url"] as! String
        let coverurl = URL(string: coverPath)!
        
        cell.cover.af_setImage(withURL: coverurl)
        
        return cell
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

