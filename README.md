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
      ├─ Request
      └─ Observer
```

# Screenshots

![image](https://user-images.githubusercontent.com/116728482/198914198-977ebb1c-5081-4c11-80fe-78a3f17f08da.png)

![image](https://user-images.githubusercontent.com/116728482/198914267-d1528cd5-263c-49fa-a54c-06aaa9f57429.png)

![image](https://user-images.githubusercontent.com/116728482/198914198-977ebb1c-5081-4c11-80fe-78a3f17f08da.png)



