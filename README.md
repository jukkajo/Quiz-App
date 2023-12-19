# Quiz-App

## What is this?

Simple quiz app, that acknowledges principles of device agnostic design and is written with Dart and Flutter framework. Existing Quiz API is used for obtaining
quiz related data. When accessing application, user is shown list of quizzes about different topics. When topic has been selected app shows random multiple-choice question, retrieved from API. As the user selects an answer, app shows whether the selected answer was correct or not. If incorrect, user can continue to select other options. Once the correct answer has been chosen, next question can be accessed. Additionally, the app has a statistics page that shows the number of correctly answered questions per topic and total count of correct answers.
    
## Try it
[Quiz App](https://jukkajo.github.io/Quiz-App-Deploy/)

## Dependencies

**dependencies:**
  flutter:
    sdk: flutter
    
  cupertino_icons: ^1.0.2
  go_router: ^12.1.3
  shared_preferences: ^2.2.2
  flutter_riverpod: ^2.4.9
  http: ^1.1.2

**dev_dependencies:**
  flutter_test:y it
    sdk: flutter
  flutter_lints: ^2.0.0

