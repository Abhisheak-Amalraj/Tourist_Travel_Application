import 'package:flutter/material.dart';

//a custom button with black background color, white text, and rounded corners.
class MyButton extends StatelessWidget {
  //function that will be called when the button is tapped.
  final Function()? onTap;
  //string that represents the text to be displayed on the button.
  final String text;

  const MyButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    /*
    The GestureDetector listens to the tap events on the button and calls the onTap function when the button is tapped.
    */
    return GestureDetector(
      onTap: onTap,
      /*
      The Container provides the styling for the button using the padding, margin, and decoration properties.
      */
      child: Container(
        padding: const EdgeInsets.all(
            25), //adds 25 pixels of padding around the button's content
        margin: const EdgeInsets.symmetric(
            horizontal:
                25), // adds 25 pixels of margin around the entire button

        //provides the button's background color and rounded corners using the color and borderRadius propertie
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
