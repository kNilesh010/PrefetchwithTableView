//
//  DownloadImage.swift
//  DownloadImage
//
//  Created by Nilesh Kumar on 25/03/22.
//

import Foundation
import UIKit

final class DownloadImage{
    
    static let shared = DownloadImage()
    
    private var isDownloading = false
    //var callback: ((UIImage?)->Void)?
    
    let url = "https://source.unsplash.com/random/"
    let url2 = "https://api.unsplash.com/photos/?client_id=_ilHtKHgkf4gIUWfOrOW8dssxXLzmc7wp9X3RydjlDY"
    
    init(){}
    
    private var cachedImage: UIImage?
    
    func downloadImage(completion: @escaping(UIImage?)-> Void){
        
//        guard !isDownloading else{
//            self.callback = completion
//            return
//        }
//
//        isDownloading = true
        
        print("caching enabled")
        
        if let newcachedImage = cachedImage {
            completion(newcachedImage)
            return
        }
        let size = Int.random(in: 100...300)
        guard let urlString = URL(string: url) else {return}
        print("\(urlString.absoluteURL)")
        let task = URLSession.shared.dataTask(with: urlString) { data, _, _ in
           
            guard let data = data else {
               // print("There is an error: \(error)")
                return
            }
            DispatchQueue.main.async { [weak self] in
                let image = UIImage(data: data)
                self?.cachedImage = image
                completion(image)
            }
        }
        task.resume()
        
    }
}
