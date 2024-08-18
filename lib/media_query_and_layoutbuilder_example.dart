import 'package:flutter/material.dart';
/*
Using the LayoutBuilder class, you can get the BoxConstraints object, which can be used for determining the maxWidth and maxHeight of the widget.

REMEMBER: The main difference between MediaQuery and LayoutBuilder is that MediaQuery uses the complete context of the screen rather than just the size of your particular widget, whereas LayoutBuilder can determine the maximum width and height of a particular widget.
 */
class MediaQueryAndLayoutBuilderExample extends StatelessWidget {
  const MediaQueryAndLayoutBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Row(
        children: [
          Flexible(
            flex: 2,
            child: LayoutBuilder(
              builder: (context, constraints) => Container(
                color: Colors.black87,
                child: Center(
                  child: Text(
                    'View 1\n\n[MediaQuery]:\n ${screenSize.width.toStringAsFixed(2)}\n\n[LayoutBuilder]:\n${constraints.maxWidth.toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: LayoutBuilder(
              builder: (context, constraints) => Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    'View 2\n\n[MediaQuery]:\n ${screenSize.width.toStringAsFixed(2)}\n\n[LayoutBuilder]:\n${constraints.maxWidth.toStringAsFixed(2)}',
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
