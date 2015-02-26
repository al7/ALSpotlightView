/*

  Copyright (c) 2015 al7dev - Alex Leite. All rights reserved.

*/

import UIKit

class ViewController: UIViewController {
    
    //MARK- View lifecycle
    
    override func loadView() {
        self.view = UIView(frame: UIScreen.mainScreen().bounds)
        self.view.backgroundColor = UIColor.whiteColor()
        
        let label = UILabel(frame: self.view.bounds)
        label.textAlignment = .Center
        label.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        label.numberOfLines = 0
        label.lineBreakMode = .ByWordWrapping
        label.text = "Tap Anywhere in screen\nto see Spotlight View"
        self.view.addSubview(label)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "onTap:")
        tapGestureRecognizer.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    //MARK- Tap Gesture Recognizer
    
    func onTap(sender: UITapGestureRecognizer) {
        let location = sender.locationInView(self.view)
        var spotlightCenter = CGPointZero
        spotlightCenter.x = location.x / self.view.bounds.size.width
        spotlightCenter.y = location.y / self.view.bounds.size.height
        
        let spotlightView = ALSpotlightView(spotlightCenter: spotlightCenter)
        spotlightView.onTapHandler = {
            spotlightView.hide()
        }
        spotlightView.show()
    }

}

