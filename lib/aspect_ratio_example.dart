import 'package:flutter/material.dart';
import 'package:fraction/fraction.dart';
/*
You can use the AspectRatio widget to size the child to a specific aspect ratio. This widget first tries the largest width permitted by the layout constraints and then decides the height by applying the given aspect ratio to the width.
 */
class AspectRatioExaple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            AspectRatioWidget(ratio: '16 / 9'),
            AspectRatioWidget(ratio: '3 / 2'),
          ],
        ),
      ),
    );
  }
}

class AspectRatioWidget extends StatelessWidget {
  final String ratio;

  AspectRatioWidget({required this.ratio});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: Fraction.fromString(ratio).toDouble(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black87,
          border: Border.all(color: Colors.white),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              'AspectRatio - $ratio',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
