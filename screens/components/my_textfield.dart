import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller; // the controller for the text field
  final String hintText; //the hint text to be displayed in the text field
  final bool
      obscureText; //a boolean value to indicate whether the text entered should be obscured

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      /*
      TextFormField widget is used to create the text field. 
      It uses the controller and obscureText values passed in from the constructor to set the properties for the text field. 
      */
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        //The decoration property is used to customize the appearance of the text field.
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[500])),
      ),
    );
  }
}
