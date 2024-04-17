/*
References:

Flutter documentation on InkWell: https://api.flutter.dev/flutter/material/InkWell-class.html
Flutter documentation on Material: https://api.flutter.dev/flutter/material/Material-class.html
Flutter documentation on Container: https://api.flutter.dev/flutter/widgets/Container-class.html
Flutter documentation on CircleAvatar: https://api.flutter.dev/flutter/material/CircleAvatar-class.html
*/

import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

//displays a card with an image and a title for a particular category

class CategoryCard extends StatelessWidget {
  final String title, image;
  final VoidCallback press;
  const CategoryCard({
    Key? key,
    /*
    takes three required parameters: title (String), image (String), and 
    press (VoidCallback), which is a function that is called when the card is pressed.
    */
    required this.title,
    required this.image,
    required this.press,
  }) : super(key: key);

/*
The CategoryCard widget returns a Padding widget with an InkWell widget as its child. 
The InkWell widget has a Material widget as its child that provides elevation and rounded borders to the card. 
The Container widget within the Material widget has a height of 55 and a circular border radius. 
It contains a Row widget that displays the image and the title of the category. 
The image is displayed using a CircleAvatar widget.
*/
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: press,
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(100),
          child: Container(
            height: 55,
            decoration: BoxDecoration(
              color: kWhiteClr,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(image),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
