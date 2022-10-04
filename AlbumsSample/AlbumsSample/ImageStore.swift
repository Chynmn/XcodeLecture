//
//  ImageStore.swift
//  AlbumsSample
//
//  Created by HyunMin Cho on 2022/07/15.
//

import Foundation
import SwiftUI

class ImageStore {
    static var cache = [String: Image]()
    
    static func load(strUrl: String, onDownload: @escaping (Image) -> Void) -> Image { //  load 요청. @escaping => onDownload가 안되었을 때
        if let image = cache[strUrl] {
            NSLog("download image exists: \(strUrl)")
            return image
        }
        guard let url = URL(string: strUrl) else {  //실패했을때
            print("Invalid URL: \(strUrl)")
            return Image(systemName: "music.note.list")
        }
        NSLog("download start: \(strUrl)")
        URLSession.shared.dataTask(with: url) { data, resp, error in
            NSLog("download end: \(strUrl)")
            var image: Image?
            if let data = data {
                if let uiImage = UIImage(data: data) {  // UIimage 생성
//                    onDownload(Image(uiImage: uiImage)) // UIimage 객체
                    image = Image(uiImage: uiImage)
                }
            }
            OperationQueue.main.addOperation {
                NSLog("download end: \(strUrl)")
                if image != nil {
                    cache[strUrl] = image
                }
                onDownload(image ?? Image(systemName: "music.note.list"))
            }
        }.resume()
        
        return Image(systemName: "music.note.list")
    }
}
