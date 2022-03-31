# advance_flutter

A new Flutter project.

## Getting Started

How to setup 

### Pasre json database 
1. Visit: https://app.mocklab.io/
{
  "email": "123",
  "password": "123",
  "lmel": "123",
  "device_type": "Samsung Note 9"
}
Reponse 
{
  "status": 0,
  "message": "success",
  
  "customer": {
    "id": "123456789",
    "name": "Mina Farid",
    "numOfNotification": 12
  },
  "contacts":{
    "phone": "123456789",
    "link": "https://www.facebook.com/hongloi12123",
    "email": "hongloi123123@gmail.com"
  }
}

2. setup:
  analyzer: ^3.4.1
  build_runner: ^2.1.8
  cupertino_icons: ^1.0.2
  dio: ^4.0.5
  flutter_svg: ^1.0.3
  json_serializable: ^6.1.5
  retrofit: ^3.0.1+1
  retrofit_generator: ^4.0.1

3. Create data/reponses.dart

after create contructor 
flutter pub get
flutter pub run build_runner build
if program request create responses.g.dart then create reponses.g.dart and run again

4. Create fromJson and toJson with every class 





