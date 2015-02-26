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
        label.text = "Tap Anywhere in screen\nto see Spotlight View"
        self.view.addSubview(label)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

