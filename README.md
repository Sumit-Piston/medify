# Medify - Medicine Reminder & Tracker

Never miss your medicine with Medify, a simple and accessible medicine reminder app designed for everyone, especially elderly users.

## 🎯 Features

- **Medicine Management**: Add, edit, and delete medications easily
- **Smart Reminders**: Get timely notifications for all your medications
- **Progress Tracking**: Keep track of your medication history and adherence
- **Accessibility**: Large buttons, clear typography, and high contrast for easy use
- **Dark Mode**: Automatic dark mode support
- **Offline First**: All data stored locally with ObjectBox

## 🏗️ Architecture

This project follows **Clean Architecture** principles with clear separation of concerns:

```
lib/
├── core/
│   ├── constants/      # App-wide constants (colors, sizes, strings)
│   ├── themes/         # Theme configuration with Nunito font
│   ├── utils/          # Utility functions (date/time, validators)
│   ├── widgets/        # Reusable UI components
│   └── di/             # Dependency injection setup
├── data/
│   ├── datasources/    # ObjectBox service
│   ├── models/         # ObjectBox data models
│   └── repositories/   # Repository implementations
├── domain/
│   ├── entities/       # Business entities
│   ├── repositories/   # Repository interfaces
│   └── usecases/       # Business logic use cases
└── presentation/
    ├── blocs/          # BLoC/Cubit state management
    ├── pages/          # App screens
    └── widgets/        # Page-specific widgets
```

## 🛠️ Tech Stack

- **Flutter SDK**: 3.35.5
- **State Management**: BLoC/Cubit pattern
- **Local Database**: ObjectBox
- **Dependency Injection**: GetIt
- **Local Notifications**: flutter_local_notifications
- **Font**: Nunito (via Google Fonts)

## 📦 Dependencies

### Core

- `flutter_bloc` - State management
- `equatable` - Value equality
- `get_it` - Service locator

### Data

- `objectbox` - Local database
- `objectbox_flutter_libs` - ObjectBox Flutter support
- `path_provider` - File system paths

### UI

- `google_fonts` - Nunito font family
- `cupertino_icons` - iOS-style icons

### Utilities

- `intl` - Internationalization and date formatting
- `flutter_local_notifications` - Push notifications
- `timezone` - Timezone support
- `permission_handler` - App permissions

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.9.2 or higher
- FVM (Flutter Version Manager) - recommended
- Xcode (for iOS development)
- Android Studio (for Android development)

### Installation

1. **Clone the repository**

   ```bash
   git clone <your-repo-url>
   cd medify
   ```

2. **Use FVM (if installed)**

   ```bash
   fvm use 3.35.5
   ```

3. **Install dependencies**

   ```bash
   fvm flutter pub get
   # or without FVM
   flutter pub get
   ```

4. **Run ObjectBox code generation**

   ```bash
   fvm flutter pub run build_runner build --delete-conflicting-outputs
   ```

5. **Run the app**
   ```bash
   fvm flutter run
   # or without FVM
   flutter run
   ```

## 🎨 Design System

### Colors

- **Primary**: Teal (#009688) - Main brand color
- **Secondary**: Green (#4CAF50) - Complementary actions
- **Success**: Green - Taken medications
- **Warning**: Orange - Pending reminders
- **Error**: Soft Red - Missed doses

### Typography

- **Font Family**: Nunito
- **Weights**: Regular (400), SemiBold (600), Bold (700)
- **Minimum Size**: 16px for body text

### Accessibility

- Minimum tap target: 44px
- High contrast ratios
- Large, clear typography
- VoiceOver/TalkBack compatible

## 📱 Development Phases

### Phase 1: MVP (Weeks 1-2) ✅

- [x] Project setup with FVM, BLoC, ObjectBox
- [x] Basic theme system with Nunito font
- [x] Clean architecture structure
- [x] Medicine CRUD operations foundation
- [ ] Simple list and form screens

### Phase 2: Core Features (Weeks 3-4)

- [ ] Notification system integration
- [ ] Reminder scheduling logic
- [ ] Basic tracking and history
- [ ] Light/dark theme refinement

### Phase 3: Polish (Weeks 5-6)

- [ ] Onboarding flow
- [ ] App store preparation
- [ ] Bug fixes and optimization
- [ ] Accessibility testing

## 🧪 Testing

```bash
# Run tests
flutter test

# Run tests with coverage
flutter test --coverage
```

## 📝 Code Generation

When you modify ObjectBox entities, run:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## 🤝 Contributing

This is a personal project, but suggestions and feedback are welcome!

## 📄 License

This project is private and not licensed for public use.

## 👤 Author

**Sumit Pal**

---

Built with ❤️ using Flutter
