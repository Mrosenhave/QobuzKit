![QobuzKitIcon](Assets/QobuzKitSmall@2x.png)
# QobuzKit

A Swift library to interact with the Qobuz Api.

## Requirements
- iOS 16.0+
- macOS 13.0+
- tvOS 16.0+
- watchOS 9.0+
- visionOS 1.0+

## Installation
Install using Swift Package Manager (SPM).

1. Open your project in Xcode.
2. Select **File > Add Package Dependency...**.
3. Enter `https://github.com/Mrosenhave/QobuzKit.git`.
4. Configure the version requirements and click **Add Package**.

## Usage

### Setup
```swift
await  QobuzClient.shared.generateCredentials()
```

Generating credentials takes some time (usually seconds), and you should therefore store the generated credentials securely using Keychain and set them again during app startup.

```swift
QobuzClient.shared.setCredentials(appId: appId, appSecret: appSecret)
```

### Making a request
```swift
let endpoint = QobuzAPI.Endpoints.Album(albumId: albumID, extra: [.albumsSameArtist, .trackIds])
do {
	let album: QBAlbum = try await QobuzClient.shared.request(endpoint)
	print("Fetched album: \(album.title)") 
} catch { 
	print("Error fetching album: \(error)") 
}
```
# Disclaimer & Legal
Accessing full tracks **require** a **paid** Qobuz subscription.

QobuzKit does not contain any private api app ids or secrets. Only code to dynamically get them from the publicly available Qobuz web player JavaScript.

QobuzKit is in no way affiliated with [Qobuz](https://www.qobuz.com).

By interacting with the Qobuz Api you are agreeing to it's [Terms of Use](http://static.qobuz.com/apps/api/QobuzAPI-TermsofUse.pdf).

# License
QobuzKit is available under the [MIT license](LICENSE).
