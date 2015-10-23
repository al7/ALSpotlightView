/*

Copyright (c) 2015 - Alex Leite (al7dev)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

import UIKit

public typealias SpotlightTapHandler = () -> Void

public class ALSpotlightView: UIView {
    
    public var spotlightCenter: CGPoint = CGPoint(x: 0.5, y: 0.5)
    public var spotlightRadius: CGFloat = 200.0
    public var modalOpacity: CGFloat = 0.6
    private weak var _targetView: UIView?
    public var targetView: UIView? { get { return _targetView } }
    public var onTapHandler: SpotlightTapHandler?
    
    public init(spotlightCenter: CGPoint, spotlightRadius: CGFloat = 200.0, modalOpacity: CGFloat = 0.6, onTapHandler: SpotlightTapHandler? = nil) {
        super.init(frame: CGRectZero)
        self.backgroundColor = UIColor.clearColor()
        self.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.spotlightRadius = spotlightRadius
        self.spotlightCenter = spotlightCenter
        self.modalOpacity = modalOpacity
        self.onTapHandler = onTapHandler
    }
    
    override public init(frame: CGRect) {
        fatalError("init(frame:) not available. Please use designated initializer")
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK- Base Overrides
    
    public override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let locations: [CGFloat] = [0.0, 1.0]
        let colors: [CGFloat] = [
            0.0, 0.0, 0.0, 0.0,
            0.0, 0.0, 0.0, self.modalOpacity
        ]
        let gradient = CGGradientCreateWithColorComponents(colorSpace, colors, locations, 2)
        
        let gradientCenter = CGPoint(x: self.spotlightCenter.x * rect.size.width, y: self.spotlightCenter.y * rect.size.height)
        let startPoint = gradientCenter
        let startRadius: CGFloat = 0.0
        let endPoint = gradientCenter
        let endRadius = self.spotlightRadius
        
        CGContextDrawRadialGradient(context, gradient, startPoint, startRadius, endPoint, endRadius, .DrawsAfterEndLocation)
    }
    
    public override func layoutSubviews() {
        self.setNeedsDisplay()
    }
    
    //MARK- Public Methods
    
    public func showInView(view: UIView?, animated: Bool = true, duration: NSTimeInterval = 0.3) {
        self._targetView = (view != nil) ? view : UIApplication.sharedApplication().keyWindow
        if let tv = self.targetView {
            self.alpha = 0.0
            self.frame = tv.bounds
            self.setNeedsDisplay()
            tv.addSubview(self)
            
            let animation: () -> Void = {
                self.alpha = 1.0
            }
            
            let completion: (Bool) -> Void = {
                finished in
                
                let tapRecognizer = UITapGestureRecognizer(target: self, action: "onSpotlightViewTap:")
                tapRecognizer.numberOfTapsRequired = 1
                self.addGestureRecognizer(tapRecognizer)
            }
            
            if animated {
                UIView.animateWithDuration(duration, animations: animation, completion: completion)
            }
            else {
                animation()
            }
        }
    }
    
    public func show(animated: Bool = true) {
        self.showInView(nil, animated: animated)
    }
    
    public func hide(animated: Bool = true, duration: NSTimeInterval = 0.3) {
        self.clearGestureRecognizers()
        self.onTapHandler = nil
        
        let animation: () -> Void = {
            self.alpha = 0.0
        }
        
        let completion: (Bool) -> Void = {
            finished in
            
            self._targetView = nil
            self.removeFromSuperview()
        }
        
        if animated {
            UIView.animateWithDuration(duration, animations: animation, completion: completion)
        }
        else {
            animation()
            completion(true)
        }
    }
    
    //MARK- Helper Methods
    
    private func clearGestureRecognizers() {
        if let recognizers = self.gestureRecognizers {
            for recognizer in recognizers {
                self.removeGestureRecognizer(recognizer)
            }
        }
    }
    
    //MARK- Action Targets
    
    func onSpotlightViewTap(sender: UITapGestureRecognizer) {
        if let handler = self.onTapHandler {
            handler()
        }
    }
    
}