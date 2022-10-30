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
        photoSearch.delegate = self
        photoSearch.tintColor = .gray
        photoSearch.showsCancelButton = false
        photoSearch.barStyle = .default
        photoSearch.sizeToFit()
        return photoSearch
    }()
    
    // MARK: - statusBar
    var statusBarHeight: CGFloat {
        let viewController = UIApplication.shared.windows.first!.rootViewController
        return viewController!.view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    }
    
    lazy var navBarHeight = self.navigationController?.navigationBar.frame.size.height ?? 80
        
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
        title = "Flickr Photos"
        view.backgroundColor = .white
        addSearchBarToView()
        setCollectionView()
        setupRefresh()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillLayoutSubviews() {
       super.viewWillLayoutSubviews()
       self.photoCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    // MARK: - Setup
    func setCollectionView() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        photoCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        layout.minimumInteritemSpacing = 8
        photoCollectionView.dataSource = self
        photoCollectionView.delegate = self
        regsiterCell()
        photoCollectionView.showsVerticalScrollIndicator = true
        self.view.addSubview(photoCollectionView)
        self.photoCollectionView.anchor(top: self.photoSearchBar.bottomAnchor, topConstant: 4, left: self.view.leftAnchor, leftConstant: 8, bottom: self.view.bottomAnchor, bottomConstant: 0, right: self.view.rightAnchor, rightConstant: 8)
        
         addObservor()
        self.fetchPhotoDisplayData()
    }
    
    func regsiterCell() {
        photoCollectionView.register(PhotosListCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    // MARK: - FetchData
    fileprivate func fetchPhotoDisplayData() {
        self.viewModel.fetchData{}
    }
    
    // MARK: - ReloadCollection when new data
    func addObservor() {
        viewModel.photoGallery.addObserver { _ in
            DispatchQueue.main.async {
                self.photoCollectionView.reloadData()
            }
        }
    }
    
    // MARK: - SearchBarToView
    func addSearchBarToView() {
        view.addSubview(photoSearchBar)
        photoSearchBar.addConstraintsForVerticalTopToSuperview(self.view,
                                                                heightConstraint: 50,
                                                                topConstraint: navBarHeight + statusBarHeight)
    }
    
    // MARK: - Refresh
    func setupRefresh() {
        photoCollectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(onPullRefresh), for: .valueChanged)
    }
    
    @objc func onPullRefresh() {
        self.viewModel.resetPage() {
            DispatchQueue.main.async {
                self.refreshControl.endRefreshing()
            }
        }
    }
}


// MARK: - SearchBarDelegate
extension PhotosListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.newPhotosCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as?  PhotosListCollectionViewCell else {fatalError("Unabel to create cell")}
        cell.configure(data: (viewModel.photoGallery.value?[indexPath.row])!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = floor((collectionView.bounds.width - 16) / 3)
        return CGSize(width: collectionViewWidth, height: collectionViewWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedPhotoInfo = viewModel.photoGallery.value?[indexPath.row]
        let vm = PhotoDetailViewModel(imageURL: selectedPhotoInfo?.urlM ?? "", title: selectedPhotoInfo?.title ?? "", photoId: selectedPhotoInfo?.id ?? "", ownerId: selectedPhotoInfo?.owner ?? "")
        let vc = PhotoDetailedViewController(viewModel: vm)
        self.navigationController?.pushViewController(vc, animated:true)
    }
    
    // MARK: - Load more photos with Pagination
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        let scrollViewCanScrollDown = contentOffsetY > scrollView.bounds.height
        let scrollViewIsAtBottom = (contentOffsetY >= (scrollView.contentSize.height - scrollView.bounds.height))
        let scrollViewCanScrollDownToBottom = (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height))
        
        if scrollViewIsAtBottom && scrollViewCanScrollDownToBottom {
            DispatchQueue.main.async {
                self.fetchPhotoDisplayData()
                self.photoCollectionView.reloadData()
            }
        }
    }
        
}

// MARK: - SearchBarDelegate
extension PhotosListViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.photoSearchBar.showsCancelButton = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.placeholder = "Electrolux"
        searchBar.resignFirstResponder()
        self.photoSearchBar.showsCancelButton = false
    }
        
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.photoSearchBar.showsCancelButton = true
        self.viewModel.searchImage = searchText
        if (self.viewModel.searchImage ?? "").isEmpty {
            viewModel.currentPage = 1
        }
        self.viewModel.resetPage() {}
    }
}
