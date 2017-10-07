//
//  ViewController.swift
//  ArchitectureLabV1
//
//  Created by allen3_huang on 06/10/2017.
//  Copyright © 2017 allen3_huang. All rights reserved.
//

import UIKit


class PostListController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var posts: [Post] = []
    var interactor: PostListInteractor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor = PostListInteractor(view: self)
        interactor?.retrivePost()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//table
extension PostListController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PostTableViewCell
        
        cell.titleLabel.text = posts[indexPath.row].title
        cell.bodyLabel.text = posts[indexPath.row].body
        
        return cell
    }
}

//interactor->view
extension PostListController: PostListViewProtocol{
    func showPosts(with posts: [Post]) {
        self.posts = posts
        tableView.reloadData()
    }
}
