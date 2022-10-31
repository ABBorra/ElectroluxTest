# ElectroluxTest
Displaying photos from Flickr Search.

# iOS MVVM

# Environment
iOS SDK: &gt; 13.0
Swift version: &gt  5.0
Xcode: 13.3

# Concepts Included
- Loading CollectionView with search hashTags for  flickr photo using flickr API - EG: [https://api.flickr.com/services/rest).
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
      |
      |-- Request
      |-- Observer
      └─ NetWorkManager
```

# Screenshots

![image](https://user-images.githubusercontent.com/116728482/198914198-977ebb1c-5081-4c11-80fe-78a3f17f08da.png)

![Simulator Screen Shot - iPhone 12 - 2022-10-31 at 09 47 13](https://user-images.githubusercontent.com/116728482/198914915-f37c0558-b014-420e-9099-57868ced6f88.png)


# Demo

![Demo9](https://user-images.githubusercontent.com/116728482/198948045-c358eaec-06c0-4c38-a0b4-5d0f4ae6092b.gif)

