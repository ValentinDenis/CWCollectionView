

# CWCollectionView

## Description
UICollectionView subclass to easily setup a collection view with a given number of columns.
Just so you know, it uses swizzling for  these two methods of UICollectionViewDelegate:
```swift
collectionView(_:layout:sizeForItemAt:)
collectionView(_:layout:insetForSectionAt:)
```
## How to use
Just use `CWCollectionView` as a class for your collection view (from storyboard or code)
Make your VC implement `CWCollectionViewDelegate`
These methods need to be implemented:
```swift
func numberOfCulumns() -> Int
func itemHeightRatio() -> CGFloat
func sectionInsets() -> UIEdgeInsets
func itemMinimumMargin() -> CGFloat
func headerHeight() -> CGSize
```
Then don't forget to set the `cwDelegate` property of your collectionView.
```swift
cwCollectionView.cwDelegate = self
```

Clone the repo to see an exemple project
## Example

To run the example project, clone the repo, and run the xcodeproj

## Requirements

CWCollectionView is compatible for iOS versions > `9.0`
CWCollectionView is written in swift `4.1`

## Installation

Just add the the following line for your target:
```ruby
pod 'CWCollectionView'
```

Then run
```ruby
pod install
```

## Author
![Cwep](http://static.750g.com/images/622-auto/d5ad3d69b82fb7b65b81313a45c80973/crepes-de-grand-mere.png =200x)
Cwep, valentindenis80@gmail.com

## License
MIT
