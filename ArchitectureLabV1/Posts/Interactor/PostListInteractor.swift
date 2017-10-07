//
//  PostListInteractor.swift
//  ArchitectureLabV1
//
//  Created by allen3_huang on 07/10/2017.
//  Copyright © 2017 allen3_huang. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class PostListInteractor: PostListInteractorProtocol {
    weak var postListView: PostListViewProtocol?
    
    init(view: PostListViewProtocol){
        postListView = view
    }
    
    func retrivePost(){
        Alamofire.request("https://jsonplaceholder.typicode.com/posts").responseArray {(response: DataResponse<[Post]>) in
            //let posts = response.result.value
            
            guard let posts = response.result.value else {
                print("API Error!")
                return
            }
            
            //self.posts = posts
            
            //success
            self.postListView?.showPosts(with: posts)
        }
    }
}
