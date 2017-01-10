# APIKitExt
[![Build Status](https://travis-ci.org/DTVD/APIKitExt.svg?branch=master)](https://travis-ci.org/DTVD/APIKitExt)

Extensions for famous type-safe networking library [APIKit](https://github.com/ishkawa/APIKit), provides easy binding with various JSON serialization such as [ObjectMapper](https://github.com/Hearst-DD/ObjectMapper), [Argo](https://github.com/thoughtbot/Argo), [Himotoki](https://github.com/ikesyo/Himotoki) and also Reactive Extension for [RxSwift](https://github.com/ReactiveX/RxSwift) :tada:

## Requirement
* Swift 3.0
* iOS 8.0 or later
* Mac OS 10.10 or later
* watchOS 2.0 or later
* tvOS 9.0 or later

## Installation
APIKitExt is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "APIKitExt"
```

# Usage
Below are detailed explanations for each combination of APIKit and JSON serialization library. You can also check demo apps in Example folder. 

* [x] [APIKit + ObjectMapper](https://github.com/DTVD/APIKitExt/blob/master/ObjectMapperUsage.md)
* [x] [APIKit + Argo](https://github.com/DTVD/APIKitExt/blob/master/ArgoUsage.md)
* [x] [APIKit + Himotoki](https://github.com/DTVD/APIKitExt/blob/master/HimotokiUsage.md)
* [ ] APIKit + SwiftyJSON
* [ ] APIKit + ModelMapper
* [ ] APIKit + JASON
* [ ] APIKit + Unbox

The demo app for APIKit + APIKitExt + Himotoki + RxSwift is following MVVM architecture with reactive unit test included. Check it out and have fun!

<img src="http://i.imgur.com/QHqZqOA.png" width="400"/>


## License
APIKitExt is available under the MIT license. See the LICENSE file for more info.
