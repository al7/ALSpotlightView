ALSpotlightView
=====================

### About

This custom control that simulates a modal spotlight effect. It can be used to, among other things, highlight a certain portion of your screen. It is completely written in Swift, and pretty simple to use. See the code below:

### Sample Code

```swift
//-- Initializing a spotlight view (shortest initialization):
let spotlightView = ALSpotlightView(spotlightCenter: CGPoint(x: 0.5, y: 0,5))

//-- Setting a tap handler (to hide when tapped)
spotlightView.onTapHandler = {
	spotlightView.hide}

//-- Presenting the spotlight view:
spotlightView.show()
```

### Customizing appearance and behavior

There are several ways you can customize the way this control looks and behaves. Here are a few things you can do:

#### Initialization:
In the sample code above, I showed how to initialize the control in the simplest way. Here's the full control initialization signature:

```swift
//-- Full Initialization:

let spotlightView = ALSpotlightView(spotlightCenter: center, 
                                    spotlightRadius: radius, 
                                       modalOpacity: opacity,
                                       onTapHandler: nil)
```
The control has the following properties: 

- ``spotlightCenter``: a CGPoint that indicates the spotlight's center *x* and *y* coordinates relative to its superview. Values for each coordinate range between *0.0* and *1.0*. For example, to display the spotlight at the center of the window, set ``spotlightCenter`` to *CGPoint(x: 0.5, y: 0.5)*
- ``spotlightRadius``: a CGFloat indicating the radius of the spotlight effect in points. 
- ``modalOpacity``: a CGFloat between *0.0* and *1.0*, adjusts the alpha value of the area around the spotlight effect.
- `onTapHandler`: closure with the following signature: ``() -> Void``, handles tap behavior after the spotlight view is visible. 

#### Showing and hiding:
	
After initializing the control, you can show it and hide it just by calling simply `show()` or `hide()`. To have more control, these methods will give you a few other options, like if you want the show/hide effect to be animated, and the duration of the transition.

On the ``showInView:``  function, you can also determine in which view you want the control to show. If you don't specify, it automatically appears on the app's key window. Here is the full signature to the functions:

```swift
//-- Showing spotlight view on a custom view:
spotlightView.showInView(view, animated: true)

//-- Showing spotlight view in one second: 
spotlightView.show(animated: true, duration: 1.0)

//-- Hiding spotlight view without animation:
spotlightView.hide(animated: false)
```

These examples should be pretty straight-forward. In any case, I intend to elaborate more on these instructions in the future. Feel free to explore with the control, and it's sample code. 

### How to use

To use this control, you can either copy the *APSpotlightView.swift* class to your project, or add the following pod to your project, using CocoaPods 0.36 and up:

```
pod 'ALSpotlightView'
```

### License

This component is available under MIT license.