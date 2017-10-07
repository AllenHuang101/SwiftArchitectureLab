//
//  Post.swift
//  ArchitectureLabV1
//
//  Created by allen3_huang on 07/10/2017.
//  Copyright © 2017 allen3_huang. All rights reserved.
//

import UIKit
import ObjectMapper

class Post: Mappable {
    var id: Int?
    var userId: Int?
    var title: String?
    var body: String?
    

    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        userId <- map["userId"]
        title <- map["title"]
        body <- map["body"]
    }
}

