//
//  MountainTableViewCell.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 12/27/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

import UIKit
import RxSwift
import AlamofireImage

class MountainTableViewCell: UITableViewCell {
    
    // MARK: - UI Properties
    @IBOutlet weak var ivThumb: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var ivLike: UIImageView!
    @IBOutlet weak var lblLike: UILabel!
    @IBOutlet weak var lblLikeCount: UILabel!
    
    // MARK: - Properties
    var viewModel: MountainTableViewCellViewModelProtocol!
    var disposeBag = DisposeBag()
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Class method
    func bind(mountain: Variable<Mountain>) {
        viewModel = MountainTableViewCellViewModel(mountain: mountain)
        
        // Bind
        bindViewModel()
        
        // Loading image
        viewModel.loadImage()
    }
    
    private func bindViewModel() {
        // Bind mountain data
        viewModel.data.asObservable()
            .subscribe(onNext: { mountain in
                self.lblName.text = mountain.name
                
                let status = LikeStatus(mountain.isLike)
                self.ivLike.image = status.image
                self.lblLike.textColor = status.textColor
                self.lblLikeCount.textColor = status.textColor
                self.lblLikeCount.text = String(mountain.likeCount + (status.isLike ? 1 : 0))
            })
            .disposed(by: disposeBag)
        
        // Bind mountain thumb
        viewModel.image.asObservable()
            .bind(to: ivThumb.rx.image)
            .disposed(by: disposeBag)
    }
}
