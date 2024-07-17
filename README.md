# news_flash

A new Flutter project.

## Getting Started

News Flash

This is a Flutter project for a simple news app that retrieves data from a mock API.

Features:

Lists news articles from a mock API.
Optionally, includes image carousels or other UI elements to display news content (replace this with specific features your app has).
Getting Started

Prerequisites:
Ensure you have Flutter and Dart installed (https://docs.flutter.dev/get-started/install).
Clone the Repository:
Bash
git clone https://github.com/indrajitFlutter/news_flash.git
Use code with caution.

Run the App:
Navigate to the project directory in your terminal.
Run the following command:
Bash
flutter run
Use code with caution.

Mock API

This app uses a mock API to simulate fetching news data. The actual implementation details of the mock API will depend on your chosen approach (local JSON file, external API service, etc.). Briefly describe how the mock API works here.

Project Structure:

lib/: Contains the core Dart code for the app.
screens/: Screens (pages) of the app (e.g., home_screen.dart).
Screen/view:this all ui parts on this project
Screen/controller: all logic and functionality and Api calling function call in controller 
Screen/models/: Data models representing news articles.
Screen/localization_checker: this use to change the language in localize
services/: Services for interacting with the mock API or other data sources and store the urls.
widgets/: Reusable UI components.
assets/: Contains static assets like images or translation files.
constants/language: creates a constant named englishUs of type Locale like as
pubspec.yaml: Defines project dependencies and configurations.
