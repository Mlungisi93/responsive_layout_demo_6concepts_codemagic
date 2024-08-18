

import 'package:flutter/material.dart';
/*
The widgets that are especially useful inside a Column or a Row are Expanded and Flexible. The Expanded widget expands a child of a Row, Column, or Flex so that the child fills the available space, whereas Flexible does not necessarily have to fill the entire available space.
 */
class ExpandedFlexibleExample extends StatelessWidget {
  const ExpandedFlexibleExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                ExpandedWidget(),
                FlexibleWidget(),
              ],
            ),
            Row(
              children: [
                ExpandedWidget(),
                ExpandedWidget(),
              ],
            ),
            Row(
              children: [
                FlexibleWidget(),
                FlexibleWidget(),
              ],
            ),
            Row(
              children: [
                FlexibleWidget(),
                ExpandedWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black87,
          border: Border.all(color: Colors.red),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),//this makes boxes grow in size as you increase the number
          child: Text(
            'Expanded',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}

class FlexibleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          border: Border.all(color: Colors.blue),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),//this makes grow in size as you increase the number
          child: Text(
            'Flexible',
            style: TextStyle(color: Colors.black87, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
