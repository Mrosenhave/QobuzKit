![QobuzKitIcon](Assets/QobuzKitSmall.png)
# QobuzKit

A Swift library to interact with the Qobuz Api.

> By interacting with the Qobuz Api you are agreeing to it's terms of use.


## Usage

### Setup
	await  QobuzClient.shared.generateCredentials()

Generating credentials takes some time (usually seconds), and you should therefore store the generated credentials securely using Keychain and set them again during app startup.

	QobuzClient.shared.setCredentials(appId: appId, appSecret: appSecret)

### Making a request
	let endpoint = QobuzAPI.Endpoints.Album(albumId: albumID, extra: [.albumsSameArtist, .trackIds])
    do {
	    let album: QBAlbum = try await QobuzClient.shared.request(endpoint)
	    print("Fetched album: \(album.title)") 
	} catch { 
		print("Error fetching album: \(error)") 
	}
