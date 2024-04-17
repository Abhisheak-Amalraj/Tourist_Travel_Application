/*
firebase_auth package is used to authenticate users with Firebase Authentication.
MyButton and MyTextField are custom widgets created to display a styled button and text field.
Colors is a class imported from the utils/colors.dart file that contains custom color values.
*/

import 'package:firebase_auth/firebase_auth.dart'; // Firebase authentication library
import 'package:flutter/material.dart'; // Material design widgets for creating UI
import 'package:yttravel/screens/components/my_button.dart'; // Custom button widget
import 'package:yttravel/screens/components/my_textfield.dart'; // Custom text field widget
import 'package:yttravel/utils/colors.dart'; // Custom color constants

/*
WelcomeScreen is a stateful widget that takes a Function() callback onTap as a parameter. 
This callback is triggered when the user taps on the "Register now" button.
*/
class WelcomeScreen extends StatefulWidget {
  final Function()? onTap;
  const WelcomeScreen({super.key, required this.onTap});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

/*
_WelcomeScreenState is the state object for the WelcomeScreen widget. 
It contains two TextEditingController objects for the email and password text fields.
*/
class _WelcomeScreenState extends State<WelcomeScreen> {
  final emailController =
      TextEditingController(); // Text controller for email text field
  final passwordController =
      TextEditingController(); // Text controller for password text field

  /*
  signUserIn() is a method that signs the user in with the email and password provided in the text fields using Firebase Authentication. 
  It displays a loading spinner while waiting for the authentication to complete and displays an error message if authentication fails
  */
  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      showErrorMessage(e.code);
    }
  }

/*
showErrorMessage() is a method that displays an alert dialog with the provided error message.
*/
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            backgroundColor: Colors.deepPurple,
            title: Center(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ));
      },
    );
  }

/*
The build() method returns a Scaffold widget that contains a background image, a centered column with the app logo, text fields, a sign in button, and a "Register now" text. 
The MyTextField widgets are used to display email and password input fields, and the MyButton widget is used to display the sign in button.
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/Welcome_bg.jpg",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/Tyne Travel.png",
                        width: 100,
                        height: 150,
                      ),
                      const Text(
                        "Unlock your adventure in the Tyne with just one tap!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 21,
                          color: kWhiteClr,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 25),
                      MyTextField(
                        controller: emailController,
                        hintText: 'email',
                        obscureText: false,
                      ),
                      const SizedBox(height: 25),
                      MyTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: true,
                      ),
                      const SizedBox(height: 10),
                      const SizedBox(height: 25),
                      MyButton(
                        text: 'Sign In',
                        onTap: signUserIn,
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Not a member?',
                            style: TextStyle(
                              color: kWhiteClr,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: widget.onTap,
                            child: const Text(
                              'Register now',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
