# Flutter Riverpod Template/Starter Project (Riverpod,go_router, Dio, MVVM)

This Flutter Template using [Riverpod](https://pub.dev/packages/riverpod) package for State management and [go_router](https://pub.dev/packages/go_router). We are using [MVVM](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel) (Model View ViewModel) architectural pattern here. For network call we are using [Dio](https://pub.dev/packages/dio) package.

# Architecture of this project: MVVM

MVVM (Model View ViewModel) is one of the most popular architectural pattern for Android App development. Basically
this pattern separates User interface from business-logic and data-logic. So that it's divided into three layers: Model layer, 
View layer and View model layer. Let's explore it more deeply.

![mvvm](https://user-images.githubusercontent.com/3769029/137336079-1f3384d0-b9d6-4462-a2c4-4a3d2cc77e8a.png)

<b>ViewModel:</b> At first let's talk about ViewModel. Actually view model is a controller where we 
implement our business logics. It receives the data from the model and process the data according to
business logic and pushed into the live data observers which is observing by view.

<b>View:</b> View is the collections of widgets like Text, Image, Dropdown etc. Which will be displayed
to the users. Even it controls the user input. When it needs any data it command the view model (In this project it's controller)
for data and observe the response. Till then it may display a loader to the user.

<b>Model:</b> Model is basically backend logic. It controls the data source.

# To configure and run this project [check here](readme_configuration_guideline.md) 
You will find at above link step by step instructions with screenshots.

# How to update app information and continue development for your own project?

1. Rename root folder name
2. Update project name and description from pubspec.yaml. 
3. Update app launcher name and icon. [Reference](https://medium.com/@vaibhavi.rana99/change-application-name-and-icon-in-flutter-bebbec297c57)
   - Android: Go to `android/app/build.gradle` file and find ` resValue "string", "app_name", "Riverpod Starter Dev" ` and change the app name for both flavors.
   - IOS: Go to `ios/Runner.xcodeproj/project.pbxproj` file and find all `APP_NAME` and replace with your app name.
4. Update your app's package name 
   - Android: [running this command](https://pub.dev/packages/change_app_package_name). underscore `_` should be use in package name.
   - IOS: Go to `ios/Runner.xcodeproj/project.pbxproj` file and find all `PRODUCT_BUNDLE_IDENTIFIER` and replace with your bundle identifier. Bundle Identifier must be in `CamelCase`.

`flutter pub run change_app_package_name:main your_package_name`

# Some Practices To Be Followed:
  - Every screen must Extend `BaseView` and must have a controller that extends `BaseController`. All the UI logics should be handled in the controller. This controller may or may not be depended on some repository for data. If the controller depends on some repository it must be passed via constructor injection during controller provider declaration.
  - Every repository will be responsible for deciding from where to fetch data(i.e., either from local data source or remote data source) and returning data to dependent controller. Every repository may be depended on some remote data source or local data source or on both and this dependency should be passed using constructor. Every repository provider should be auto disposable i.e., use `.autoDispose`.
  - Every widget should be `Stateless` and wrap with `Consumer` builder if it dpends on some data from its controller and watch that data using `ref.watch`. If you need to call some controller function use `ref.read'
  - The `watch` and `read` method should not be called asynchronously, like inside an onPressed of an ElevatedButton. Nor should it be used inside initState and other State life-cycles.In those cases, consider using ref.read instead.
  - DON'T use ref.read inside the build method
  - If a screen controller depends on some controller that extends `ChangeNotifier` should be passesd as controller provider to that dependent controller and must be disposed on `onDisposed` callback using `ref.invalidate(provider)`.
