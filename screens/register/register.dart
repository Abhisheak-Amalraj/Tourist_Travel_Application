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
RegisterPage is a stateful widget that takes a Function() callback onTap as a parameter. 
This callback is triggered when the user taps on the "Login now" button.
*/
class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

/*
_RegisterPageState is the state object for the RegisterPage widget. 
It contains three TextEditingController objects for the email, password and confirm password text fields.
*/

class _RegisterPageState extends State<RegisterPage> {
  final emailController =
      TextEditingController(); // Text controller for email text field
  final passwordController =
      TextEditingController(); // Text controller for password text field
  final confirmPasswordController =
      TextEditingController(); // Text controller for confirm password text field

  /*
  signUserUp() is a method that registers the user in with the email, password and confirm password provided in the text fields using Firebase Authentication. 
  It displays a loading spinner while waiting for the authentication to complete and displays an error message if authentication fails
  */

  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        passMatchMessage();
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      if (e.code == 'user-not-found') {
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
      }
    }
  }

// Shows a dialog box for password mismatch error
  void passMatchMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Text('Passwords don\'t match!'),
        );
      },
    );
  }

// Shows a dialog box for incorrect email error
  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Text('Incorrect Email'),
        );
      },
    );
  }

  // Shows a dialog box for incorrect password error
  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Text('Incorrect Password'),
        );
      },
    );
  }

  // // sign user in method
  // void signUserIn() async {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return const Center(
  //           child:
  //               CircularProgressIndicator()); //Shows a loading spinner while Firebase is being used
  //     },
  //   );

  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text,
  //       password: passwordController.text,
  //     );
  //     Navigator.pop(context); // Close the loading spinner dialog
  //   } on FirebaseAuthException catch (e) {
  //     // Catch Firebase authentication exceptions
  //     Navigator.pop(context); // Close the loading spinner dialog

  //     showErrorMessage(e.code); // Show error message based on exception code
  //   }
  // }

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
                      const SizedBox(height: 10),
                      MyTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: true,
                      ),
                      const SizedBox(height: 10),
                      MyTextField(
                        controller: confirmPasswordController,
                        hintText: 'Confirm Password',
                        obscureText: true,
                      ),
                      const SizedBox(height: 10),
                      const SizedBox(height: 25),
                      MyButton(
                        text: 'Sign Up',
                        onTap: signUserUp,
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(
                              color: kWhiteClr,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: widget.onTap,
                            child: const Text(
                              'Login now',
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
