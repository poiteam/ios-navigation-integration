# PoilabsNavigation iOS Integration

Sample iOS app that integrates **PoilabsNavigation** with Swift Package Manager.

## INSTALLATION

PoilabsNavigation is distributed with Swift Package Manager. CocoaPods is no longer supported.

### Swift Package Manager

1. In Xcode, select **File > Add Package Dependencies...**
2. Enter the repository URL: `https://github.com/poiteam/ios-navigation-pod.git`
3. Choose **Exact Version** `7.3.1` and add the **PoilabsNavigation** product to your app target.

The package contains PoilabsNavigation, PoilabsMapView, PoilabsCommon and Mapbox Maps 11.18.0. PoilabsPositioning, PoilabsSdkAnalytics and PoilabsCore are resolved automatically.

### Migrating from CocoaPods

Remove `pod 'PoilabsNavigation'` (and any `PoilabsCore`, `PoilabsPositioning` or `PoilabsSdkAnalytics` lines) from your `Podfile`, run `pod install` (or `pod deintegrate` if no other pods remain), then add the package as described above.

## PRE-REQUIREMENTS

Add the following keys to your `Info.plist`:

- Privacy - Location Usage Description
- Privacy - Location When In Use Usage Description
- Privacy - Bluetooth Peripheral Usage Description
- Privacy - Bluetooth Always Usage Description

## USAGE

Replace `APPLICATION_ID`, `APPLICATION_SECRET_KEY` and `UNIQUE_ID` in `ViewController.swift` with the values provided by Poilabs.

``` Swift
import PoilabsNavigation

let settings = PLNNavigationSettings.sharedInstance()
settings?.applicationId = "APPLICATION_ID"
settings?.applicationSecret = "APPLICATION_SECRET_KEY"
settings?.navigationUniqueIdentifier = "UNIQUE_ID"
settings?.applicationLanguage = "en" // en, tr, hr, ar, de, ru, pl

PLNavigationManager.sharedInstance()?.getReadyForStoreMap(completionHandler: { error in
    guard error == nil else { return }
    let carrierView = PLNNavigationMapView(frame: self.navigationView.bounds)
    carrierView.awakeFromNib()
    carrierView.delegate = self
    self.currentCarrier = carrierView
    self.navigationView.addSubview(carrierView)
})
```

See the [PoilabsNavigation documentation](https://github.com/poiteam/ios-navigation-pod) for all features.
