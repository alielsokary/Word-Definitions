# Word Definitions

[![iOS](https://github.com/alielsokary/Word-Definitions/actions/workflows/iOS.yml/badge.svg)](https://github.com/alielsokary/Word-Definitions/actions/workflows/iOS.yml)


## Demo

![Simulator Screen Recording1 - iPhone 15 Pro - 2024-07-14 at 05 45 09](https://github.com/user-attachments/assets/9015efdd-068e-4d6a-8055-6ea487075def)


## Features
 - [x] Search word definitions using [Dictionary Api](https://dictionaryapi.dev/).
 - [x] Using **Moya** for network requests.
 - [x] Using **Realm** for local data caching.
 - [x] UI implemented using SwiftUI.
 - [x] Tested.

## Structure
```
.
├── WordDefinitions #    iOS APP 
│   ├── App   
│   ├── Model   
│   ├── Coordinator   
│   ├── Scenes
│   │    ├── Search
│   │    │    │    ├── Coordniantor
│   │    │    │    ├── View Model
│   │    │    │    ├── View
│   │    │    │    ├── Service
│   │    │    │    ├── Repository
│   │    ├── Definition Details
│   │    │    │    ├── Coordniantor
│   │    │    │    ├── View Model
│   │    │    │    ├── View
│   ├── Networking
│   ├── Storage
│   ├── Extensions
├── WordDefinitionsTests  # Unit Tests
│   │    ├── SearchViewModelTests
│   │    ├── EntriesRepositoryTests
│   │    ├── EntryServiceTests
│   │    ├── Helpers   
```

## Architecture 
The project is designed with the MVVM-C Architectural design pattern.
The **Coordinator** is used for injecting dependency and manage routing.

