Neil Skinner's Movie App

This app is written in Swift using XCode 10.0.

I have chosen not to use any libraries as something this small does not require them, however I am comfortable in using either Cocoapods or Carthage to manage dependencies.

A known issue is that on poor network connections, the images on the initial collectionView will duplicate / load in the wrong cells. To make this more robust I would update the async image loader to handle such instances.
