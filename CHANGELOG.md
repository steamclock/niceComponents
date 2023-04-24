# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0]
- Added lineSpacing to NiceTextStyle.
- Added tracking to FontStyle.

## [1.0.0]
- Lots of prep for initial public release!
- Added a bunch of documentation, comments and clarification.
- Removed some unused, or outdated components that have SwiftUI equivalents now.
- Renamed a handful of components and helpers to be more clear or avoid potential collisions.

## [0.6.0]
- Removed stateful view and view+if helpers, to be moved into a separate utils library.

## [0.5.0]
- Add functionality to NiceText to allow setting a maximum dynamic type font size
- Add two helper functions to `View`, `if` and `iflet` that allow for optional view modifying

## [0.4.0] - 2022-07-22
- Reworked stateful view
- ResizeableImage now supports loading / fallbackImage 


## [0.3.0] - 2022-07-19
- Min iOS version incremented to iOS 15
- NiceButton introduced
- All Button components are now NiceButtons
- ResizableImage supports systemIcons
- NiceButtonStyle replaced ButtonStyle
- NiceBorderStyle replaced BorderStyle
- AttributedString support for Text components
- Update to StatefulView to support opaque view types
- LoadingView improvement


## [0.2.0]
- Added shadowStyle 
- Text components implement NiceText
- Layout documentation
- ContentLoadState is now equatable
- ResizableImage handles both bundle string and URL
- InactiveButton removed onClick modifier


## [0.1.0]
- Initial release! Adds a basic set of components and a first pass at config options to customize them.
