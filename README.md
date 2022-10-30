# ElectroluxTest
Displaying photos from Flickr Search.

# iOS MVVM

# Environment
iOS SDK: &gt; 13.0
Swift version: &gt  5.0
Xcode: 13.3

# Concepts Included
- Loading CollectionView with hashTags for  flickr photo using API - EG: [https://api.flickr.com/services/rest).
- Selection of photos navigation to Photo Details.
- REST API integration
- Dependency injection 
- Collection with PageList and load more

# Folder Structure

```
ElectroluxTest
├─ Modules
│  │ └─ PhotoList
│  │    ├─ Model
│  │    │  └─ PhotoListModel
│  │    ├─ Views
│  │    │  └─ PhotoListCollectionViewCell
│  │    ├─ ViewModel
│  │    │  └─ PhotoListViewModel
│  │    │
│  │    └─ Controller
│  │       └─ PhotosListViewController
│  └─ DetailsList
|       ├─ ViewModel
|       |    └─ PhotoDetailViewModel
|       └─ Controller
|           └─ PhotosListDetailedViewController
└─ Library
   ├─ Constants
   │  └─ Secrets
   ├─ Extensions
   │  └─ ViewExtension 
   |  |
   |  └─ UIImageViewExtension
   |  └─ UIImageViewExtension
   |  └─ Image Saver
   |
   └─ UIImageViewExtension
   ├─ ApiRepository
   │  ├─ PhotosApiRepository
   │  │  └─  PhotosApiRepository
   │  │    
   │  └─ ApiUrl
   └─ Util
      ├─ Request
      └─ Observer
```
