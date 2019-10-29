# FlashFeed iOS

## Overview
**FlashFeed iOS** is a News App offering delivering news from more than 30,000 different sources, including all major news outlets and popular websites

<img src="Demo/demo0.gif" width="210" height="420">   <img src="Demo/demo1.gif" width="210" height="420">   <img src="Demo/demo2.gif" width="210" height="420">  <img src="Demo/demo4.gif" width="210" height="420">


## Development
**FlashFeed iOS** was developed in `Swift 5.0` and fetch data using **News.org API**. To get a free `api key` for your application [Click here](https://newsapi.org/docs/get-started)


## Usage
**FlashFeed iOS** uses a private `api key` not provided in this repository, as a result running this project without another one **WILL NOT WORK**. To fix this, simpy get a new `api key` from [News API](https://newsapi.org/docs/get-started) and replace `API.KEY.NEWS` in `NetworkManager.swift` with that new key
```swift
// NetworkManager.swift

let urlHeaders = ["X-Api-Key": YOUR_API_KEY_HERE]
```


## Other
Copyright © 2019 Jonathan Sack
