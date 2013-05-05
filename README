# KMCMultipleGLKViewControllerTest

## Experiment

I built this project to test:

- Can you can use multiple GLKViewControllers in a single app?
- Can you use the child view controller mechanism would to present two GLKViewControllers on the same screen?

It appears to work just fine!

## Classes

- KMCOpenGLViewController is the example GLKViewController from the "OpenGL Game" Xcode template.
- KMCRootViewController is a KMCOpenGLViewController that, when tapped, presents a KMCContainerViewController modally.
- KMCContainerViewController is a plain UIViewController that creates two KMCOpenGLViewControllers as child view controllers. When either is tapped, the modal view dismisses.
- KMCAppDelegate presents a KMCRootViewController in a window.

