        

# Calculator and Weather

## This is a trial project demonstrating a range of features and approaches. 
## The project uses a layered architecture (trial version).

 Implementation of animation in CustomPainter using the basic package.

 The application implements user registration with validation and saving to shared_preferences.

 User authorization. Upon authorization, the user's name will be automatically filled in.
 In case of password loss, it is possible to reset the password.

 The main screen contains a calculator, and any operations clear the screen (as intended).

 When equals is pressed, the operation history and result are recorded in the sqflite database.

 When the history button is pressed, you can navigate to a page where information is read from
 the database and displayed on the screen as colored cards, showing information about the operations
 and their times. If necessary, each of the cards can be deleted, and accordingly, this deletion 
 occurs from the database.

 At the top of the screen, there is weather information from the openweathermap.org website

 Also, the current date and day of the week are displayed on the screen.

The following were used in the application:

# BlocProvider
# Cubit
# Dio
# Shared Preferences
# SQFlite

# Registration
# Authorization
# REST API
# Bloc Architecture
# CRUD
