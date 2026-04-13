# Roamly

Roamly is a Flutter-based local exploration app that helps users discover nearby places, events, and hidden gems.
[Screenshots to be added]

## Features

- Discover nearby places and attractions
- Map-based exploration
- Discover local events
- Save favorite locations
- Smart recommendations for local exploration

## Tech Stack
- Flutter
- Dart
- Google Maps API (planned)
- Firebase (planned)

## Installation

1. Clone the repository
```
git clone https://github.com/daivik007/Roamly-App.git
```

2. Navigate into the project directory
```
cd Roamly-app
```

3. Install dependencies
```
flutter pub get
```

4. Run the app
```
flutter run
```

## Project Structure

```
Roamly-App/
│
├── android/                # Android specific configuration
├── ios/                    # iOS specific configuration
├── web/                    # Web build support
├── macos/                  # macOS build files
├── linux/                  # Linux build files
├── windows/                # Windows build files
│
├── lib/                    # Main application source code
│   ├── main.dart           # App entry point
│   │
│   ├── screens/            # UI screens/pages
│   │   ├── home_screen.dart
│   │   ├── explore_screen.dart
│   │   └── profile_screen.dart
│   │
│   ├── widgets/            # Reusable UI components
│   │   ├── place_card.dart
│   │   └── event_tile.dart
│   │
│   ├── models/             # Data models
│   │   └── place_model.dart
│   │
│   ├── services/           # API calls and backend services
│   │   ├── location_service.dart
│   │   └── firebase_service.dart
│   │
│   └── utils/              # Helper functions and constants
│
├── assets/                 # Images, icons, fonts
│
├── pubspec.yaml            # Flutter dependencies and assets
├── README.md               # Project documentation
└── .gitignore              # Git ignored files
```


## Contributing

Contributions are welcome. Feel free to open issues or submit pull requests.

## License

This project is licensed under the MIT License.
