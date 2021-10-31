# iTunes Code Case

- Data layer, Business layer and Presentation layer of the application are separated at the application level.
- Application views are written programmatically.

## Packages
- RxSwift
  - Implemented for reactive programming. Operation Managers are written by using RxSwift.
- Lottie
  - Injected to make a beautiful loading animation while change the media type.
- DefaultNetworkOperationManager
  - DefaultNetworkOperationManager used to manage api request and implement networking layer. Its advantage over other libraries is that it can be edited by me. That's why I chose it.
  [https://github.com/emircanaydin/DefaultNetworkOperationPackage](https://github.com/emircanaydin/DefaultNetworkOperationPackage)

## Description

- Application is written by using MVVM Design pattern. 
- All user interface compoents are created by using programmatically programming to enchance reusability and to reduce maintenance effor. 
  - Some user interfaces are also reused inside the application.
- SearchView view created to searching and listing result.
  - SearchController is added on the navigation bar.
  - SegmentedController is added on the top of view.
- DetailView view created to show the details of the selected item

