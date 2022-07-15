//
//  ContentView.swift
//  AlbumsSample
//
//  Created by HyunMin Cho on 2022/07/14.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var albumStore = AlbumStore.singleton
    var body: some View {
        NavigationView {
            List {
                ForEach(albumStore.albums, id:\.albumTitle) { album in
                    NavigationLink(destination: AlbumItemView(album: album)) {
                        AlbumItemView(album: album)
                    }
                }
            }
            .navigationTitle(Text("Albums"))
        }
        .onAppear {
            albumStore.load()
        }
//        Text("Hello, world!")
//            .padding()
//            .onAppear {
//                AlbumStore.singleton.load()
//            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AlbumItemView: View {
    static let imageSize = 60
    let album: Album
    @State var image: Image?
    var body: some View {
        HStack {
            loadAlbumImage()
//                .font(.largeTitle)
                .resizable()
                .frame(width: CGFloat(AlbumItemView.imageSize),
                       height: CGFloat(AlbumItemView.imageSize))
            VStack(alignment: .leading) {
                Text("\(album.albumTitle)")
                    .font(.headline)
                Spacer()
                Text("\(album.artistName)")
                    .font(.footnote)
                    .foregroundColor(.green)
            }
        }
    }
    func loadAlbumImage() -> Image {
        if image != nil {
            return image!
        }
        return ImageStore.load(strUrl: album.image) { image in
            self.image = image
        }
    }
}

struct AlbumItemView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            AlbumItemView(album: Album(
                albumTitle: "Title", artistName: "Artist", image: "???"
            ))
        }
    }
}
