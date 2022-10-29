//
//  PhotosListViewController.swift
//  ElectroluxTest
//
//  Created by AB_Borra on 10/30/22.
//

import UIKit

class PhotosListViewController: UIViewController {
    
    // MARK: - Components
    var photoCollectionView: UICollectionView!
    let refreshControl = UIRefreshControl()
    
    /*SearchBar*/
    lazy var photoSearchBar : UISearchBar = {
        let photoSearch = UISearchBar()
        photoSearch.placeholder = "Electrolux"
        //photoSearch.delegate = self
        photoSearch.tintColor = .gray
        photoSearch.showsCancelButton = false
        photoSearch.barStyle = .default
        photoSearch.sizeToFit()
        return photoSearch
    }()
    
    // MARK: - Dependency
    let viewModel: PhotoListViewModel
    
    // MARK: - Lifecycle
    init(viewModel: PhotoListViewModel = PhotoListViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

