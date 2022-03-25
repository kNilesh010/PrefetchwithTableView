//
//  PhotoCollectionViewCell.swift
//  PhotoCollectionViewCell
//
//  Created by Nilesh Kumar on 25/03/22.
//

import UIKit

class PhotoCollectionViewCell: UITableViewCell {
    
    static let identifier = "PhotoCollectionViewCell"
    
    private let photo: UIImageView = {
        let photo = UIImageView()
        photo.contentMode = .scaleAspectFill
        photo.clipsToBounds = true
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(photo)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photo.image = nil
    }
    
    func addConstraints(){
        NSLayoutConstraint.activate([
            photo.widthAnchor.constraint(equalToConstant: 300),
            photo.heightAnchor.constraint(equalToConstant: 300),
            photo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            photo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            photo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    public func configCell(with viewModel: DownloadImage){
        viewModel.downloadImage {[weak self] image in
            DispatchQueue.main.async {
                self?.photo.image = image
                print(self?.photo.image)
            }
        }
    }
    
}
