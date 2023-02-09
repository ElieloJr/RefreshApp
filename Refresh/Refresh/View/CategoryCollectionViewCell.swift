//
//  CategoryCollectionViewCell.swift
//  Refresh
//
//  Created by Usr_Prime on 30/11/22.
//

import UIKit
import SDWebImage

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoryCollectionViewCell"
    
    private lazy var imageBackground: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .darkGray
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var darkFilter: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.opacity = 0.5
        return view
    }()
    
    private lazy var titleCategoy: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Categoria"
        label.textAlignment = .center
        label.font = UIFont(name: "Geeza Pro Bold", size: 20)
        label.canConstraints()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 40
        self.layer.masksToBounds = true
        
        addSubview(imageBackground)
        addSubview(darkFilter)
        addSubview(titleCategoy)
        
        imageBackground.frame = contentView.bounds
        darkFilter.frame = contentView.bounds
        titleCategoy.centerY(self.centerYAnchor)
        titleCategoy.leading(self.leadingAnchor, spacing: 4)
        titleCategoy.trailing(self.trailingAnchor,spacing: -4)
        imageBackground.image = UIImage(named: "jornalBackground.png")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with category: Category) {
        titleCategoy.text = category.name
        imageBackground.sd_setImage(with: URL(string: category.imageURL),
                                   completed: nil)
    }
}
