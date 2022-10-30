//
//  PhotoDetailedViewController.swift
//  ElectroluxTest
//
//  Created by AB_Borra on 10/30/22.
//

import UIKit

class PhotoDetailedViewController: UIViewController {

    // MARK: - Propeties
    var imageUrl: String? = nil
    
    // MARK: - VM
    var viewModel: PhotoDetialViewModelProtocol

    // MARK: - StatusBar height cal and
    var statusBarHeight: CGFloat {
        let viewController = UIApplication.shared.windows.first!.rootViewController
        return viewController!.view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    }
    
    lazy var navBarHeight = self.navigationController?.navigationBar.frame.size.height ?? 80
    
    // MARK: - VM initialiser 
    init(viewModel: PhotoDetialViewModelProtocol = PhotoDetailViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupComponents()
    }

    // MARK: - Setup Save button
    func saveImageButton() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveBtnAction))
        self.navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    // MARK: - Save photo to Gallery
    @objc func saveBtnAction(sender: UIBarButtonItem) {
        let imageSaver = ImageSaver()
        imageSaver.downloadToPhotoAlbum(image: self.userImage.image ?? UIImage())
    }
   
    // MARK: - components
    
    fileprivate func setupComponents() {
        saveImageButton()
        self.addViews()
    }
    lazy var userImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.layer.cornerRadius = CGFloat(5)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var titleNameLbl: UILabel = {
        return genericLbl(textfont: .boldSystemFont(ofSize: 18))
    }()
    
    lazy var photoIdLbl: UILabel = {
        return genericLbl(textfont: .systemFont(ofSize: 18))
    }()
    
    lazy var ownerLbl: UILabel = {
        return genericLbl(textfont: .systemFont(ofSize: 18))
    }()
    
    // MARK: - setup genericLbl
    func genericLbl(textfont: UIFont) -> UILabel {
        let lbl = UILabel(frame: .zero)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.textColor = .black
        lbl.font = textfont
        lbl.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        return lbl
    }
    // MARK: - Adding SubViews
    func addViews() {
        userImage.loadImageWith(urlString: viewModel.imageURL ?? "")
        titleNameLbl.text = "Title: \(viewModel.title ?? "")"
        photoIdLbl.text = "PhotoID: \(viewModel.photoId ?? "")"
        ownerLbl.text =  "OwnerID: \(viewModel.ownerId ?? "")"
        
        self.view.addSubview(userImage)
        self.view.addSubview(titleNameLbl)
        self.view.addSubview(ownerLbl)
        self.view.addSubview(photoIdLbl)
        addConstraints()
    }
    
    // MARK: - component Constraints
    func addConstraints() {
        
        userImage.anchor(top: self.view.topAnchor,
                         topConstant: navBarHeight + statusBarHeight,
                         left: self.view.leftAnchor,
                         leftConstant: 8,
                         right: self.view.rightAnchor,
                         rightConstant: 8,
                         heightConstant: self.view.frame.height/2)
        
        titleNameLbl.anchor(top: userImage.bottomAnchor,
                            topConstant: 10,
                            left: self.view.leftAnchor,
                            leftConstant: 8,
                            right: self.view.rightAnchor,
                            rightConstant: 8,
                            heightConstant: 30,
                            isHeightConstantLowPriority: true)
       
        ownerLbl.anchor(top: titleNameLbl.bottomAnchor,
                        topConstant: 10,
                        left: self.view.leftAnchor,
                        leftConstant: 8,
                        right: self.view.rightAnchor,
                        rightConstant: 8,
                        heightConstant: 20)
        
        photoIdLbl.anchor(top: ownerLbl.bottomAnchor,
                          topConstant: 10,
                          left: self.view.leftAnchor,
                          leftConstant: 8,
                          right: self.view.rightAnchor,
                          rightConstant: 8,
                          heightConstant: 20)
    }
}
