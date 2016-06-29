//
//  BigImageViewController.swift
//  Table application
//
//  Created by Joseph Dion on 6/28/16.
//  Copyright © 2016 Joe. All rights reserved.
//

import UIKit

class BigImageViewController: UIViewController {
    
    
    
    // Image details
  
    var pic = Picture(Image: "", Locaiton: "")
   
    // Graphics Detail
    var deltaY = CGFloat(1000)
    var deltaX = CGFloat(1000)
    var duration = 0.4
    var delay = 0.0
    var labelShow = false
    var commentShow = false
    
    // Directions for the move function
    enum directions
    {
        case up
        case down
        case left
        case right
        case original
    }

    // MARK: Outlets
    @IBOutlet var locationLabel: UILabel!
    
    @IBOutlet var plusButton: UIButton!
    
    @IBOutlet var commentButton: UIButton!
   
    @IBOutlet var commentView: UIView!
    @IBOutlet var bigImage: UIImageView!
    
    // MARK: IBActions
    
    @IBAction func close(sender: AnyObject)
    {
    
    }
    @IBAction func comments(sender: AnyObject) {
        
        if commentShow == false {
            move(commentView, direction: directions.original)
            commentShow = true
            
            commentButton.setImage(UIImage(named: "exit"), forState: .Normal)
        }
        else {
            move(commentView, direction: directions.left)
            commentShow = false
            commentButton.setImage(UIImage(named: "user"), forState: .Normal)
        }
    }
    
    // THis is orginally seen onscreen as the green plus
    @IBAction func add(sender: AnyObject)
    {
        
        if labelShow == false {
              move(locationLabel, direction: directions.original)
            labelShow = true
            
            plusButton.setImage(UIImage(named: "minus"), forState: .Normal)
        }
        else {
            move(locationLabel, direction: directions.down)
            labelShow = false
            plusButton.setImage(UIImage(named: "plus"), forState: .Normal)
        }
    }
    
    
    // ViewDidLoad 
    override func viewDidLoad() {
         super.viewDidLoad()
        
        //commentView.hidden = false
        
        moveInstant(commentView, direction: directions.left)
        
        plusButton.setImage(UIImage(named: "plus"), forState: .Normal)
        
        commentButton.setImage(UIImage(named: "user"), forState: .Normal)
        
        bigImage.image = UIImage(named: pic.image)
        
        //print(picture.image)
        
        locationLabel.text = pic.location
        
        moveInstant(locationLabel, direction: directions.down)
        
        
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "loadComments" {
            let destinationViewController = segue.destinationViewController as! CommentTableViewController
            
            addTestComments()
            destinationViewController.pic = self.pic
            
        }
    }
    
    
    // Adds test comments
    func addTestComments() {
        pic.addComment(Comment(commentor: "Lisa", Text: "Nice Pics Dude"))
        pic.addComment(Comment(commentor: "Bob", Text: "This is a cool app"))
        pic.addComment(Comment(commentor: "Angel Investors", Text: "Here is 1 Billion $!"))
    }

    
    // MARK: Custom move functions
    
    // move with duration
    func move(stack: UILabel, direction: directions) -> Void {
        
        
        // up
        if direction == directions.up{
            UIView.animateWithDuration(duration, delay: delay, options: [], animations: {
                stack.transform = CGAffineTransformMakeTranslation(0, self.deltaY)
                }, completion: nil)}
            
            // down
        else if direction == directions.down {
            UIView.animateWithDuration(duration, delay: delay, options: [], animations: {
                stack.transform = CGAffineTransformMakeTranslation(0, -(self.deltaY))
                }, completion: nil)
        }
        else {
            UIView.animateWithDuration(duration, delay: delay, options: [], animations: {
                stack.transform = CGAffineTransformMakeTranslation(0, -0)
                }, completion: nil)
            
        }
    }
    
    // Move without duration
    func moveInstant(stack:UILabel, direction:directions) -> Void {
        
        // up
        if direction == directions.up{stack.transform = CGAffineTransformMakeTranslation(0, deltaY)}
        else if direction == directions.down{stack.transform = CGAffineTransformMakeTranslation(0, -(self.deltaY))}
        else {stack.transform = CGAffineTransformMakeTranslation(0, 0)}
        
    }
    
    // for view
    func move(stack: UIView, direction: directions) -> Void {
        
        
        // up
        if direction == directions.up{
            UIView.animateWithDuration(duration, delay: delay, options: [], animations: {
                stack.transform = CGAffineTransformMakeTranslation(0, self.deltaY)
                }, completion: nil)}
            
            // down
        else if direction == directions.down {
            UIView.animateWithDuration(duration, delay: delay, options: [], animations: {
                stack.transform = CGAffineTransformMakeTranslation(0, -(self.deltaY))
                }, completion: nil)}
            
            
        else if direction == directions.left {
            UIView.animateWithDuration(duration, delay: delay, options: [], animations: {
                stack.transform = CGAffineTransformMakeTranslation(-self.deltaX, 0)
                }, completion: nil)}
            
        else {
            UIView.animateWithDuration(duration, delay: delay, options: [], animations: {
                stack.transform = CGAffineTransformMakeTranslation(0, -0)
                }, completion: nil)
            
        }
    }
    
    // Move without duration
    func moveInstant(stack:UIView, direction:directions) -> Void {
        
        // up
        if direction == directions.up{stack.transform = CGAffineTransformMakeTranslation(0, deltaY)}
        else if direction == directions.down{stack.transform = CGAffineTransformMakeTranslation(0, -(self.deltaY))}
        else if direction == directions.left{stack.transform = CGAffineTransformMakeTranslation(-self.deltaX, 0)}
        else {stack.transform = CGAffineTransformMakeTranslation(0, 0)}
        
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
