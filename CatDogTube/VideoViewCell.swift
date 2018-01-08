//
//  VideoViewCell.swift
//  CatDogTube
//
//  Created by ken on 2018/01/07.
//  Copyright © 2018年 Kenichiro Sato. All rights reserved.
//

import UIKit
import SDWebImage

class VideoViewCell: UICollectionViewCell {

    static let aspectRatio : CGFloat = 5 / 16
    
    static let nibName = String(describing:VideoViewCell.self)
    
    static let reuseIdintifier = String(describing:VideoViewCell.self)

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var imageViewWidth: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setThumbnail(with imageUrl: URL)  {
        imageView.sd_setImage(with: imageUrl,
                              placeholderImage: nil,
                              options: SDWebImageOptions.retryFailed,
                              completed: {_,_, cacheType,_ in
                                self.imageView.addGradientLayer(UIColor.white)
                                if let height = self.imageView.image?.size.height {
                                    self.imageViewWidth.constant = height/9*16
                                }
        })
    }
    
    func set(title: String) {
        self.title.text = title
    }

}
