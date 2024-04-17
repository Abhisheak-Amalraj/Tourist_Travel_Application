import 'package:flutter/material.dart';
import 'package:yttravel/screens/auth/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

/* 
Initializing Firebase and running the Flutter app. 
It calls WidgetsFlutterBinding.ensureInitialized() to ensure that the Flutter bindings are initialized before the app runs.
It then calls Firebase.initializeApp() to initialize Firebase, passing in the default Firebase options for the current platform 
*/
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /*
    This widget is the root of the application.
    It extends the StatelessWidget class and overrides the build() method to return a MaterialApp widget. 
    The MaterialApp widget sets the app's title to "Tyne Travel", hides the debug banner, and sets the home page to AuthPage()
  */
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tyne Travel',
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}
