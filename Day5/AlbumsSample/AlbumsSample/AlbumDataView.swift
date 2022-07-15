//
//  AlbumDataView.swift
//  AlbumsSample
//
//  Created by HyunMin Cho on 2022/07/15.
//

import SwiftUI

struct AlbumDetailView: View {
    let album: Album
    var body: some View {
        List {
            Image(systemName: "music.note.list")
                .resizable()
                .frame(width: 200, height: 200)
            HStack {
                Text("Album Title")
                Text(album.albumTitle)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .font(Font.headline)
            HStack {
                Text("Artist Name")
                Text(album.artistName)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            ForEach(0 ..< album.albumTitle.count, id: \.self) { index in
                let si = album.albumTitle.startIndex
                let ei = album.albumTitle.index(si, offsetBy: index + 1)
                let subs = String(album.albumTitle[si ..< ei])
                Text("Song \(index+1) : \(subs)")
            }
        }
        .navigationTitle(album.albumTitle)
    }
}

struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailView(album: Album(
            albumTitle: "Title", artistName: "Artist", image: "???"
        ))
    }
}
