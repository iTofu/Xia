# Xia

[![Travis](https://img.shields.io/travis/iTofu/Xia.svg?style=flat)](https://travis-ci.org/iTofu/Xia)
[![CocoaPods](https://img.shields.io/cocoapods/v/Xia.svg)](http://cocoadocs.org/docsets/Xia)
[![CocoaPods](https://img.shields.io/cocoapods/l/Xia.svg)](https://raw.githubusercontent.com/iTofu/Xia/master/LICENSE)
[![CocoaPods](https://img.shields.io/cocoapods/p/Xia.svg)](http://cocoadocs.org/docsets/Xia)
[![LeoDev](https://img.shields.io/badge/blog-LeoDev.me-brightgreen.svg)](https://LeoDev.me)

🌟 Naughty flexible alert view above the navigation bar. Xia is a part of [DaXia](https://github.com/iTofu/DaXia).

<img src="https://raw.githubusercontent.com/iTofu/Xia/master/XiaDemoImage/XiaDemoImage.png" alt="Xia" title="Xia" width="320"/>

```
In me the tiger sniffs the rose.

心有猛虎，细嗅蔷薇。
```

Welcome to my blog：https://LeoDev.me



## Contents

* [Requirements](https://github.com/iTofu/Xia#requirements)
* [Installation](https://github.com/iTofu/Xia#installation)
* [Usage](https://github.com/iTofu/Xia#usage)
* [Preview](https://github.com/iTofu/Xia#preview)
* [ChangeLog](https://github.com/iTofu/Xia#changelog)
* [Support](https://github.com/iTofu/Xia#support)
* [License](https://github.com/iTofu/Xia#license)



## Requirements

* iOS 8.0+
* Xcode 8.0+
* Swift 3.0+



## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1.0+ is required to build Xia.

To integrate Xia into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
use_frameworks!

target '<Your Target Name>' do
    pod 'Xia'
end
```

### Manually

If you prefer not to use the aforementioned dependency manager, you can integrate Xia into your project manually.



## Usage

* Quick Start:

  ```swift
  import Xia

  func showXia() {

      Xia.showInfo("Praise at most 10 people every day")

      Xia.showSuccess("Praised success")

      Xia.showWarning("Failed, Please try again later")
  }
  ```

* Resources:

  * [F.A.Q.](https://github.com/iTofu/Xia/issues?q=)


## Preview

<img src="https://raw.githubusercontent.com/iTofu/Xia/master/XiaDemoImage/XiaDemoImageInfo.png" alt="Xia" title="Xia" width="280"/> <img src="https://raw.githubusercontent.com/iTofu/Xia/master/XiaDemoImage/XiaDemoImageSuccess.png" alt="Xia" title="Xia" width="280"/> <img src="https://raw.githubusercontent.com/iTofu/Xia/master/XiaDemoImage/XiaDemoImageWarning.png" alt="Xia" title="Xia" width="280"/>


## ChangeLog

### V 0.0.4

* Add swipe gesture recognizer.

### V 0.0.3

* Public `textColor`.

### V 0.0.2

* Improve.

### V 0.0.1

* Hello World!



## Support

* If you have any question, just [commit a issue](https://github.com/iTofu/Xia/issues/new).

* Mail: `echo bGVvZGF4aWFAZ21haWwuY29tCg== | base64 -D`

* Blog: https://LeoDev.me

* Donations:

  * PayPal:

    [![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=leodaxia@gmail.com&item_name=leodaxia@gmail.com)

  * Alipay or Wechat Pay:

    <img src="https://cdnqiniu.leodev.me/donate.png?v=1" alt="Donate with Alipay or Wechat Pay" title="Donate with Alipay or Wechat Pay" width="320"/>

  Please note: donation does not imply any type of service contract.


## License

Xia is released under the [MIT License](https://github.com/iTofu/Xia/blob/master/LICENSE).
