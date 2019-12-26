# FancyScrollView

![](Demo/FancyScrollView.gif)

I spent a lot of time looking for a way to recreate the UI of the ScrollViews in Stock Apple Apps (i.e. App Store and Apple Music) inside of SwiftUI.

And here is the result! I call it `FancyScrollView`.
It's a ScrollView with a few extra perks:

## Fancy Blur when scrolling
Use a `FancyScrollView` instead of a normal `ScrollView` and it will add a nice blur in the safe area. Making your View look much cleaner while scrolling!

```swift
FancyScrollView {
	VStack {
		...
	}
}
```

**Result:**

![](Demo/NoHeader.gif)

## Including a Header

I was really surprised by the fact I couldn't find a proper Package for adding a nice Parallax header to a ScrollView. So I included it here! And you can customize everything about it:

### Scrolling Up Behavior:

You can specify one of two behaviors:

```swift
public enum ScrollUpHeaderBehavior {
    case parallax // Will zoom out all pretty ;)
    case sticky // Will stay at the top
}
```

### Scrolling Down Behavior:

```swift
public enum ScrollDownHeaderBehavior {
    case offset // Will move the header with the content
    case sticky // Will stay at the top and the content will cover the header
}
```

### Let's see them in action!

Here's every combination between scrolling behaviors

#### Parallax + Offset (Default):

This is the default and appears to be the most neutral and standard version of the ScrollView Header in the Market. Chances are, you want this one!

```swift
FancyScrollView(title: "The Weeknd",
                headerHeight: 350,
                scrollUpHeaderBehavior: .parallax,
                scrollDownHeaderBehavior: .offset,
                header: { Image(...).resizable().aspectRatio(.fill) }) {
	...
}
```

**Result:**

![](Demo/Parallax+Offset.gif)

#### Parallax + Sticky:

This combination is designed to imitate the header from the Artist Detail View in Apple Music.

```swift
FancyScrollView(title: "The Weeknd",
                headerHeight: 350,
                scrollUpHeaderBehavior: .parallax,
                scrollDownHeaderBehavior: .sticky,
                header: { Image(...).resizable().aspectRatio(.fill) }) {
	...
}
```

**Result:**

![](Demo/Parallax+Sticky.gif)

#### Sticky + Offset:

This combination is designed to imitate the header from the "Today" showcases in the App Store.

```swift
FancyScrollView(title: "The Weeknd",
                headerHeight: 350,
                scrollUpHeaderBehavior: .sticky,
                scrollDownHeaderBehavior: .offset,
                header: { Image(...).resizable().aspectRatio(.fill) }) {
	...
}
```

**Result:**

![](Demo/Sticky+Offset.gif)

#### Sticky + Sticky:

I'm not sure who's looking for this behavior, but it looks cool. So, you do you!

```swift
FancyScrollView(title: "The Weeknd",
                headerHeight: 350,
                scrollUpHeaderBehavior: .sticky,
                scrollDownHeaderBehavior: .sticky,
                header: { Image(...).resizable().aspectRatio(.fill) }) {
	...
}
```

**Result:**

![](Demo/Sticky+Sticky.gif)

## Known Issues

- The pop back navigation bar gesture is broken in these. 
	- Sorry, but I couldn't find a proper way to get access to the Gesture Recognizer without the ScrollView being the first screen in a `NavigationView`
- The back button always appears when you have a header (Only use it for details or modals)
	- I didn't find a way to know whether there's a screen to go back to
- On light mode with a header the Status Bar doesn't look great. Didn't find a way to change it to white.
