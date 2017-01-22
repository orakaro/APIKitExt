# APIKitExt
[![Build Status](https://travis-ci.org/DTVD/APIKitExt.svg?branch=master)](https://travis-ci.org/DTVD/APIKitExt)
[![Version](https://img.shields.io/cocoapods/v/APIKitExt.svg)]()
[![Language](https://img.shields.io/badge/language-swift3.0-f48041.svg?style=flat)](https://developer.apple.com/swift)

Extensions for famous type-safe networking library [APIKit](https://github.com/ishkawa/APIKit), provides easy binding with various JSON serialization libraries such as [ObjectMapper](https://github.com/Hearst-DD/ObjectMapper), [Argo](https://github.com/thoughtbot/Argo), [Himotoki](https://github.com/ikesyo/Himotoki) and also Reactive Extension for [RxSwift](https://github.com/ReactiveX/RxSwift) :tada:

## Requirement
* Swift 3.0
* iOS 8.0 or later
* Mac OS 10.10 or later
* watchOS 2.0 or later
* tvOS 9.0 or later

## Installation
APIKitExt is available through [CocoaPods](http://cocoapods.org). Depend on which Json serialization library that you want to use with APIKit, you can add to your Podfile as below:

```ruby
# APIKit + ObjectMapper
pod "APIKitExt/ObjectMapper"
```
```ruby
# APIKit + Argo
pod "APIKitExt/Argo"
```
```ruby
# APIKit + Himotoki
pod "APIKitExt/Himotoki"
```
```ruby
# APIKit + SwiftyJSON
pod "APIKitExt/SwiftyJSON"
```
```ruby
# APIKit + ModelMapper
pod "APIKitExt/ModelMapper"
```
```ruby
# APIKit + JASON
pod "APIKitExt/JASON"
```
```ruby
# APIKit + Unbox
pod "APIKitExt/Unbox"
```

# Usage
Below are detailed explanations for each combination of APIKit and JSON serialization library. You can also check demo apps in Example folder.

* [x] [APIKit + ObjectMapper](https://github.com/DTVD/APIKitExt/blob/master/Documentations/ObjectMapperUsage.md)
* [x] [APIKit + Argo](https://github.com/DTVD/APIKitExt/blob/master/Documentations/ArgoUsage.md)
* [x] [APIKit + Himotoki](https://github.com/DTVD/APIKitExt/blob/master/Documentations/HimotokiUsage.md)
* [x] [APIKit + SwiftyJSON](https://github.com/DTVD/APIKitExt/blob/master/Documentations/SwiftyJSONUsage.md)
* [x] [APIKit + ModelMapper](https://github.com/DTVD/APIKitExt/blob/master/Documentations/ModelMapperUsage.md)
* [x] [APIKit + JASON](https://github.com/DTVD/APIKitExt/blob/master/Documentations/JASONUsage.md)
* [x] [APIKit + Unbox](https://github.com/DTVD/APIKitExt/blob/master/Documentations/UnboxUsage.md)


The demo app for APIKit + APIKitExt + Himotoki + RxSwift is following MVVM architecture with reactive unit test included. Check it out and have fun!

<img src="http://i.imgur.com/QHqZqOA.png" width="400"/>


## License
APIKitExt is available under the MIT license. See the LICENSE file for more info.
