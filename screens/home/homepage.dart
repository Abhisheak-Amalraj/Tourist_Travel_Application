/*
References:

Flutter: https://flutter.dev/
Dart programming language: https://dart.dev/
Firebase Authentication: https://firebase.google.com/docs/auth
Material UI widgets: https://api.flutter.dev/flutter/material/material-library.html
ListView widget: https://api.flutter.dev/flutter/widgets/ListView-class.html
CircleAvatar widget: https://api.flutter.dev/flutter/material/CircleAvatar-class.html
MaterialPageRoute widget: https://api.flutter.dev/flutter/material/MaterialPageRoute-class.html
*/

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yttravel/screens/home/widgets/category_card.dart';
import 'package:yttravel/screens/places/place_page.dart';
import 'package:yttravel/utils/colors.dart';

/*
The HomeScreen class is a stateful widget that represents the home screen of the app. 
It has a default constructor and overrides the createState() method to create an instance of _HomeScreenState
*/
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

/*
The user variable is declared as a global variable and is used to retrieve the current user information from Firebase Authentication
*/
final user = FirebaseAuth.instance.currentUser!;

/*
The signUserOut() method signs out the current user from the app using Firebase Authentication.
*/
void signUserOut() {
  FirebaseAuth.instance.signOut();
}

/*
The _HomeScreenState class extends the State class and overrides the build() method to build the UI of the home screen.
*/
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    /*
    The Scaffold widget represents the overall layout of the screen and contains an AppBar and a Container widget as its body.
    */
    return Scaffold(
      /*
      The AppBar widget contains an IconButton widget that invokes the signUserOut() method when pressed.
      */
      appBar: AppBar(
        actions: const [
          IconButton(
            onPressed: signUserOut,
            icon: Icon(Icons.logout),
          )
        ],
      ),
      /*
      The Container widget contains a Column widget wrapped in a SingleChildScrollView widget to enable scrolling on the screen. 
      It also has a background image and padding to add some style to the screen.
      */
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/Welcome_bg.jpg"),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: SingleChildScrollView(
            /*
            The Column widget contains a Row widget, a Text widget, and a ListView widget to display different categories of places in Newcastle.
            */
            child: Column(children: [
              const SizedBox(
                height: 100,
              ),
              // app bar
              /*
              The Row widget displays a circle avatar and a welcome message that greets the current user by their email address.
              */
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/ncl.jpg"),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Hello",
                          style: const TextStyle(
                            color: kBlackClr,
                            fontSize: 18,
                          ),
                          children: [
                        TextSpan(
                            text: ", ${user.email!}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ))
                      ]))
                ],
              ),

              const SizedBox(
                height: 25,
              ),

              /*
              The Text widget displays a welcome message and an introductory text that invites users to explore 
              different categories of places in Newcastle.
              */
              const Text(
                "Explore Newcastle, all at your fingertips!",
                style: TextStyle(
                  fontSize: 21,
                  color: kWhiteClr,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 45,
              ),

              SizedBox(
                height: 360,
                /*
                The ListView widget contains several CategoryCard widgets that represent different categories of places in Newcastle. 
                Each CategoryCard widget has an image, a title, and a press callback function that navigates the user to a new screen when the card is pressed
                */
                child: ListView.builder(
                    itemCount: 1,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          children: [
                            CategoryCard(
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const PlatePage(index: 3),
                                  ),
                                );
                              },
                              image: "assets/images/history.jpg",
                              title: "Historic Buildings",
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            CategoryCard(
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const PlatePage(index: 1),
                                  ),
                                );
                              },
                              image: "assets/images/museum.jpg",
                              title: "Museums",
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            CategoryCard(
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const PlatePage(index: 0),
                                  ),
                                );
                              },
                              image: "assets/images/park.jpg",
                              title: "Parks",
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            CategoryCard(
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const PlatePage(index: 2),
                                  ),
                                );
                              },
                              image: "assets/images/library.jpg",
                              title: "Libraries",
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 200,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
