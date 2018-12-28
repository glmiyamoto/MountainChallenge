//
//  MountainDetailViewController.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 12/27/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MountainDetailViewController: UIViewController {
    
    // MARK: - UI Properties
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrefectures: UILabel!
    @IBOutlet weak var lblElevation: UILabel!
    @IBOutlet weak var lblLike: UILabel!
    @IBOutlet weak var lblLikeCount: UILabel!
    @IBOutlet weak var ivMountainImage: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var ivSuggestionImage1: UIImageView!
    @IBOutlet weak var lblSuggestionName1: UILabel!
    @IBOutlet weak var ivSuggestionImage2: UIImageView!
    @IBOutlet weak var lblSuggestionName2: UILabel!
    @IBOutlet weak var btnLike: UIButton!
    
    // MARK: - Properties
    private var viewModel: MountainDetailViewModelProtocol!
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Bind view model
        bindViewModel()
        
        // Loading images
        viewModel.loadImage()
    }
    
    // MARK: - View Action
    @IBAction func onBtnLikeClicked(_ sender: Any) {
        viewModel.toggleLikeStatus()
    }

    // MARK: - Class method
    func bind(mountain: Variable<Mountain>, suggestions: [Mountain]) {
        viewModel = MountainDetailViewModel(mountain: mountain, suggestions: suggestions)
    }
    
    private func bindViewModel() {
        // Bind mountain data
        viewModel.data.asObservable()
            .subscribe(onNext: { mountain in
                self.lblName.text = mountain.name
                self.lblPrefectures.text = mountain.prefectures.joined(separator: ",")
                self.lblElevation.text = "標高\(mountain.elevation)m"
                self.lblDescription.text = mountain.description
                
                let status = LikeStatus(mountain.isLike)
                self.lblLike.textColor = status.textColor
                self.lblLikeCount.textColor = status.textColor
                self.lblLikeCount.text = String(mountain.likeCount + (status.isLike ? 1 : 0))
                self.btnLike.backgroundColor = status.buttonBackgroundColor
                self.btnLike.setImage(status.buttonImage, for: .normal)
            })
            .disposed(by: disposeBag)
        
        // Bind suggestions data
        viewModel.suggestions.asObservable()
            .subscribe(onNext: { suggestions in
                if let item1: Mountain = suggestions.first {
                    self.lblSuggestionName1.text = item1.name
                }
                
                if let item2: Mountain = suggestions.last {
                    self.lblSuggestionName2.text = item2.name
                }
            })
            .disposed(by: disposeBag)
        
        // Bind mountain image
        viewModel.image.asObservable()
            .bind(to: ivMountainImage.rx.image)
            .disposed(by: disposeBag)
        
        viewModel.suggestionImage1.asObservable()
            .bind(to: ivSuggestionImage1.rx.image)
            .disposed(by: disposeBag)
        
        viewModel.suggestionImage2.asObservable()
            .bind(to: ivSuggestionImage2.rx.image)
            .disposed(by: disposeBag)
    }
}
