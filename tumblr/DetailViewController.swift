//
//  DetailViewController.swift
//  tumblr
//
//  Created by ARG Lab on 2/12/18.
//  Copyright © 2018 ARG Lab. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var largeView: UIImageView!
    var post:[String:Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let photos = post["photos"] as! [[String: Any]]
        let photo = photos[0]
        let type = photo["original_size"] as! [String: Any]
        let coverPath = type["url"] as! String
        let coverurl = URL(string: coverPath)!
        largeView.af_setImage(withURL: coverurl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
