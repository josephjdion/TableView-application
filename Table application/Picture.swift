//
//  Picture.swift
//  Table application
//
//  Created by Joseph Dion on 6/27/16.
//  Copyright © 2016 Joe. All rights reserved.
//

import Foundation

// Custom picture object
class Picture {
    
    // Image and location
    let image : String
    let location : String
    var comments : [Comment]
    
    
    // Initializer for the custom object
    init(Image:String, Locaiton: String){
        image = Image
        location = Locaiton
        comments = [Comment(commentor: "Joe")]
    }
    
    func toString() -> String {
        return "Image: " + image + " Location: " + location + "\n"
    }
    
    func addComment(commentToAdd: Comment) {
        comments.append(commentToAdd)
    }
  
    
}
