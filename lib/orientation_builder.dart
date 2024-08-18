/*
To determine a widget’s current orientation, you can use the OrientationBuilder class.

REMEMBER: This is different from the device orientation that you can retrieve by using MediaQuery.
 */
import 'package:flutter/material.dart';

class OrientationBuilderExample extends StatelessWidget {
  const OrientationBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    Orientation deviceOrientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.black87,
              child: OrientationBuilder(
                builder: (context, orientation) => Center(
                  child: Text(
                    'View 1\n\n[MediaQuery orientation]:\n$deviceOrientation\n\n[OrientationBuilder]:\n$orientation',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: OrientationBuilder(
              builder: (context, orientation) => Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    'View 2\n\n[MediaQuery orientation]:\n$deviceOrientation\n\n[OrientationBuilder]:\n$orientation',
                    style: const TextStyle(color: Colors.black87, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
