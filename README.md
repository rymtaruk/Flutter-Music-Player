# Music Player Application

This is Music Player application

## Supported features
1. Play music from iTunes API.
2. Using Flutter.

## Architecture Details
1. Flutter Programming.
2. Implemented with MVVM.

## Library used
1. [dio](https://pub.dev/packages/dio) for hitting API/Web Server
2. [AudioPlayers](https://pub.dev/packages/audioplayers) for play audio by URL
3. [injectable](https://pub.dev/packages/injectable) for Dependency Injection 
4. [provider](https://pub.dev/packages/provider) for state management

### Flutter Commands
#### Update Dependencies
flutter pub get
#### To Build GETIt Service Locator Instance
flutter packages pub run build_runner build --delete-conflicting-outputs
#### To Clean Generated File
flutter packages pub run build_runner clean

### Code Scaffolding And MVVM References:
- [https://medium.com/flutterworld/flutter-mvvm-architecture-f8bed2521958](https://medium.com/flutterworld/flutter-mvvm-architecture-f8bed2521958)
- [https://github.com/moezshakeri/flutter_clean_project/tree/main/src](https://github.com/moezshakeri/flutter_clean_project/tree/main/src)
- [https://cassiuspacheco.com/flutter-mvvm-and-clean-architecture-part-1-setup](https://cassiuspacheco.com/flutter-mvvm-and-clean-architecture-part-1-setup)
- [https://flutterawesome.com/a-sample-flutter-app-using-injection-routing-and-simple-authentication-follows-clean-code-and-best-practices/](https://flutterawesome.com/a-sample-flutter-app-using-injection-routing-and-simple-authentication-follows-clean-code-and-best-practices/)
### Code DI Injectable References:
- [https://resocoder.com/2020/02/04/injectable-flutter-dart-equivalent-to-dagger-angular-dependency-injection/](https://resocoder.com/2020/02/04/injectable-flutter-dart-equivalent-to-dagger-angular-dependency-injection/)


### Created By
Reynard Mangatta Taruk

reynardmtaruk@gmail.com