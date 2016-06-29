//
//  Comment.swift
//  Table application
//
//  Created by Joseph Dion on 6/28/16.
//  Copyright © 2016 Joe. All rights reserved.
//

import Foundation
class Comment {
    
    var who : String
    var text : String
    
    init(commentor: String, Text : String)
    {
        self.who = commentor
        self.text = Text
    }
    
    init(commentor:String)
    {
        self.who = commentor
        self.text = commentor + " posted this image."
    }
    
    
}