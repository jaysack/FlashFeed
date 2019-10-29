# FlashFeed

## Overview
**FlashFeed** is a News App offering delivering news from more than 30,000 different sources, including all major news outlets and popular websites

<img src="Demo/demo0.gif" width="210" height="420">   <img src="Demo/demo1.gif" width="210" height="420">   <img src="Demo/demo2.gif" width="210" height="420">  <img src="Demo/demo3.gif" width="210" height="420">


## Development
**FlashFeed** was developed in `Swift 5.0` and fetch data using **News.org API**. To get a free `api key` for your application [Click here](https://newsapi.org/docs/get-started)


## Usage
**Flash** uses a private `api key` not provided in this repository, as a result running this project without another one **WILL NOT WORK**. To fix this, simpy get a new `api key` from [News API](https://newsapi.org/docs/get-started) and replace `API.KEY.NEWS` in `Endpoint.swift` with that new key
```swift
// Endpoint.swift

struct ENDPOINT {

    static let BASE = "https://newsapi.org/v2/"

    struct SOURCE {
        static let BASE = "\(ENDPOINT.BASE)sources"
        static let DEFAULT = "\(ENDPOINT.SOURCE.BASE)?apiKey=\(ENTER_YOUR_NEW_KEY_HERE)"
    }

    struct HEADLINES {
        static let BASE = "\(ENDPOINT.BASE)top-headlines"
        static let DEFAULT = "\(ENDPOINT.HEADLINES.BASE)?apiKey=\(ENTER_YOUR_NEW_KEY_HERE)"
    }

}
```


## Other
Copyright © 2019 Jonathan Sack
