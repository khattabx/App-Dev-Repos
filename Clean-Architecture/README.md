# Bookly

<img src="assets/preview/preview.png" />

### Releases
You can find the application in the **Releases** section or by following this [link](https://github.com/ahvvad/Bookly-Arch/releases).

---
### Overview
Bookly is a Flutter-based application for browsing and discovering books using an `external API`. The main objective of this project is to implement `Clean Architecture` and BLoC principles while ensuring `clean code practices`. Built with this approach, the project maintains modularity and scalability. It leverages **BLoC** for state management, **Hive** for local storage, and **Dio** for API handling.
##### Through this project, I successfully implemented:
 - GoRouter for efficient navigation.
 - Dependency Injection using `get_it`.
 - Cached Network Images for optimized image loading.
 - Google Fonts and Font Awesome Icons for a polished UI.

---
#### Clean Architecture
```
lib/
├── widgets/
│   ├── presentation/
│   │   ├── logic_holders/
│   │   ├── components/
│   ├── domain/
│   │   ├── use_cases/
│   │   ├── entities/
│   ├── data/
│   │   ├── repositories/
│   │   ├── remote_data_sources/
│   │   ├── local_data_sources/
│   │   ├── models/
├── constants.dart
└── main.dart
```
#### Project Architecture Implementing Principles
```
lib/
├── Core/
│   ├── errors/
│   ├── utils/
│   │   ├── functions/
│   ├── widgets/
├── Features/
│   ├── home/
│   │   ├── data/
│   │   │   ├── data_sources/
│   │   │   ├── models/
│   │   │   ├── repos/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   ├── repos/
│   │   │   ├── use_cases/
│   │   ├── presentation/
│   │   │   ├── manager/
│   │   │   ├── views/
│   │   │   │   ├── widgets/
│   ├── search/
│   │   ├── presentation/
│   │   │   ├── views/
│   │   │   │   ├── widgets/
│   ├── splash/
│   │   ├── presentation/
│   │   │   ├── views/
│   │   │   │   ├── widgets/
├── constants.dart
├── main.dart

```
---
### Explore the UI through [this link](assets/preview)

#### **Contact me anytime if you have questions.** : [Here](https://linktr.ee/userahmed)
