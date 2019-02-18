//
//  CastCell.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/17/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

class CastCell: UITableViewCell {
    
    static let identifier = "CastCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var castImageOne: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "aqua")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    var castImageTwo: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "aqua")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    var castImageThree: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "aqua")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private func configure() {
        backgroundColor = UIColor.detailsRed
        setupCastImages()
    }
}

// MARK - autolayout code
extension CastCell {
    private func setupCastImages() {
        let imageSize: CGFloat = 65
        contentView.addSubview(castImageTwo)
        NSLayoutConstraint.activate([
            castImageTwo.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            castImageTwo.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            castImageTwo.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            castImageTwo.heightAnchor.constraint(equalToConstant: imageSize),
            castImageTwo.widthAnchor.constraint(equalToConstant: imageSize)
            ])
        
        contentView.addSubview(castImageOne)
        NSLayoutConstraint.activate([
            castImageOne.centerYAnchor.constraint(equalTo: castImageTwo.centerYAnchor),
            castImageOne.heightAnchor.constraint(equalToConstant: imageSize),
            castImageOne.widthAnchor.constraint(equalToConstant: imageSize),
            castImageOne.rightAnchor.constraint(equalTo: castImageTwo.leftAnchor, constant: -30)
            ])
        
        contentView.addSubview(castImageThree)
        NSLayoutConstraint.activate([
            castImageThree.centerYAnchor.constraint(equalTo: castImageTwo.centerYAnchor),
            castImageThree.heightAnchor.constraint(equalToConstant: imageSize),
            castImageThree.widthAnchor.constraint(equalToConstant: imageSize),
            castImageThree.leftAnchor.constraint(equalTo: castImageTwo.rightAnchor, constant: 30)
            ])
        
        castImageOne.layer.cornerRadius = imageSize / 2
        castImageTwo.layer.cornerRadius = imageSize / 2
        castImageThree.layer.cornerRadius = imageSize / 2
    }
}

