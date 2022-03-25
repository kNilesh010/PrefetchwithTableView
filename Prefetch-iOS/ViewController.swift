//
//  ViewController.swift
//  Prefetch-iOS
//
//  Created by Nilesh Kumar on 25/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let images = Array(1...100).map{_ in DownloadImage()}
    
   // var downloadImage = []
    

    private let table: UITableView = {
        let table = UITableView()
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 300
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .systemBlue
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        table.register(PhotoCollectionViewCell.self, forCellReuseIdentifier: PhotoCollectionViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        table.prefetchDataSource = self
        table.frame = view.bounds
      //  fetchImage()
    }
    
//    private func fetchImage(){
//        DownloadImage.shared.downloadImage { image in
//            self.downloadImage = image
//        }
//    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("The count of images: \(images.count)")
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        //cell.textLabel?.text = images[indexPath.row]
        cell.configCell(with: images[indexPath.row])
        //print(images[indexPath.row].url)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300.0
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            let model = images[indexPath.row]
            model.downloadImage { _ in
                
            }
        }
    }
    
}
