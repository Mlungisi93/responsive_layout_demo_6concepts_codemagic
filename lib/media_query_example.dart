
import 'package:flutter/material.dart';
/*
You can use MediaQuery to retrieve the size (width/height) and orientation (portrait/landscape) of the screen.
 */
class MediaQueryExample extends StatelessWidget {
  const MediaQueryExample({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: Center(
          child: Text(
            'View\n\n[MediaQuery width]: ${screenSize.width.toStringAsFixed(2)}\n\n[MediaQuery orientation]: $orientation',
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}