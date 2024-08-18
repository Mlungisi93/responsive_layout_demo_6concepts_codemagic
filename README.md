# responsive_layout_demo_codemagic

A new Flutter project.

How to build responsive layout in Flutter
Oct 20, 2020
Use M1 Mac mini VMs by default with Codemagic🚀 Build faster
Written by Souvik Biswas
Flutter, being a cross-platform app development framework, supports devices with widely varying screen sizes: It can run on a device as small as a smartwatch to devices like a large TV. It’s always a challenge to adapt your app to such a variety of screen sizes and pixel densities using the same codebase.

There is no hard-and-fast rule for designing a responsive layout in Flutter. In this article, I will show you some of the approaches that you can follow while designing such a layout.

Before moving on to building responsive layouts in Flutter, I would like to shed some light on how Android and iOS handle layouts for different screen sizes natively.

So, let’s get started, but first, let us know how many mobile app projects do you have in Git repositories?

None
One
Two or more
Android approach

In order to handle different screen sizes and pixel densities, the following concepts are used in Android:

1. ConstraintLayout

One of the revolutionary tools introduced in the Android world for UI design is the ConstraintLayout. It can be used for creating flexible and responsive UI designs that adapt to different screen sizes and dimensions. ConstraintLayout allows you to specify the position and size for each view according to spatial relationships with other views in the layout.

For more information regarding ConstraintLayout, check out this article here.
But this does not solve the issue with large devices, where just stretching or resizing the UI components is not the most elegant way of taking advantage of the screen real estate. This also applies to devices like smartwatches, which have very little screen real estate, and resizing the components to fit that screen size might result in a weird UI.

2. Alternative layouts

To solve the above issue, you can use alternative layouts for different-sized devices. For example, you can use split view in devices like tablets to provide a good user experience and use the large screen real estate wisely.



In Android, you can define separate layout files for different screen sizes, and the Android framework handles the switching between these layouts automatically as per the screen size of the device.

3. Fragments

Using Fragment, you can extract your UI logic into separate components so that while designing multi-pane layouts for large screen sizes, you do not have to define the logic separately. You can just reuse the logic that you have defined for each fragment.

4. Vector graphics

As opposed to being created using pixel bitmaps, vector graphics are images defined in XML files as paths and colors. They can scale to any size without scaling artifacts. In Android, you can use VectorDrawable for any kind of illustration, such as icons.

iOS approach

The concepts used by iOS for defining responsive layouts are as follows:

1. Auto Layout

Auto Layout can be used for constructing adaptive interfaces where you can define rules (known as constraints) that govern the content in your app. Auto Layout automatically readjusts layouts according to the specified constraints when certain environmental variations (known as traits) are detected.

2. Size classes

Size classes are traits that are automatically assigned to content areas based on their size. iOS dynamically makes layout adjustments based on the size classes of a content area. On iPad, size classes also apply when your app runs in a multitasking configuration.

3. Some UI elements

There are a few other UI elements that you can use for building responsive UIs on iOS, like UIStackView, UIViewController, and UISplitViewController.

How Flutter differs

Even if you are not an Android or iOS developer, by this point, you should have gotten an idea of how these platforms handle responsiveness natively.

In Android, to display multiple UI views on a single screen, you use Fragments, which are like reusable components that can run inside an Activity of an app.

You can run multiple Fragments inside an Activity, but you cannot run multiple Activities in a single app at the same time.

In iOS, UISplitViewController, which manages child view controllers in a hierarchical interface, is used for controlling multiple view controllers.

Now, let’s move on to Flutter.

Flutter has introduced the concept of widgets. Basically, they are the building blocks that can be connected together to build an entire app.

Remember that in Flutter, every screen and even the entire app are also widgets!

Widgets are reusable by nature, so you do not need to learn any other concepts while building responsive layouts in Flutter.

Responsiveness in Flutter

As I said earlier, I will go over the important concepts that are required for developing responsive layouts, and then, it’s your choice how exactly you want to implement them in your app.

1. MediaQuery

You can use MediaQuery to retrieve the size (width/height) and orientation (portrait/landscape) of the screen.

An example of this is as follows:


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Container(
        color: CustomColors.android,
        child: Center(
          child: Text(
            'View\n\n' +
                '[MediaQuery width]: ${screenSize.width.toStringAsFixed(2)}\n\n' +
                '[MediaQuery orientation]: $orientation',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}


2. LayoutBuilder

Using the LayoutBuilder class, you can get the BoxConstraints object, which can be used for determining the maxWidth and maxHeight of the widget.

REMEMBER: The main difference between MediaQuery and LayoutBuilder is that MediaQuery uses the complete context of the screen rather than just the size of your particular widget, whereas LayoutBuilder can determine the maximum width and height of a particular widget.
An example demonstrating this is as follows:


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: LayoutBuilder(
              builder: (context, constraints) => Container(
                color: CustomColors.android,
                child: Center(
                  child: Text(
                    'View 1\n\n' +
                        '[MediaQuery]:\n ${screenSize.width.toStringAsFixed(2)}\n\n' +
                        '[LayoutBuilder]:\n${constraints.maxWidth.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: LayoutBuilder(
              builder: (context, constraints) => Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    'View 2\n\n' +
                        '[MediaQuery]:\n ${screenSize.width.toStringAsFixed(2)}\n\n' +
                        '[LayoutBuilder]:\n${constraints.maxWidth.toStringAsFixed(2)}',
                    style: TextStyle(color: CustomColors.android, fontSize: 18),
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


3. OrientationBuilder

To determine a widget’s current orientation, you can use the OrientationBuilder class.

REMEMBER: This is different from the device orientation that you can retrieve by using MediaQuery.
An example demonstrating this is as follows:


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Orientation deviceOrientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: CustomColors.android,
              child: OrientationBuilder(
                builder: (context, orientation) => Center(
                  child: Text(
                    'View 1\n\n' +
                        '[MediaQuery orientation]:\n$deviceOrientation\n\n' +
                        '[OrientationBuilder]:\n$orientation',
                    style: TextStyle(color: Colors.white, fontSize: 18),
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
                    'View 2\n\n' +
                        '[MediaQuery orientation]:\n$deviceOrientation\n\n' +
                        '[OrientationBuilder]:\n$orientation',
                    style: TextStyle(color: CustomColors.android, fontSize: 18),
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


4. Expanded and Flexible

The widgets that are especially useful inside a Column or a Row are Expanded and Flexible. The Expanded widget expands a child of a Row, Column, or Flex so that the child fills the available space, whereas Flexible does not necessarily have to fill the entire available space.

An example showing various combinations of Expanded and Flexible is as follows:


class HomePage extends StatelessWidget {
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
          color: CustomColors.android,
          border: Border.all(color: Colors.white),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
          color: CustomColors.androidAccent,
          border: Border.all(color: Colors.white),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Flexible',
            style: TextStyle(color: CustomColors.android, fontSize: 24),
          ),
        ),
      ),
    );
  }
}


5. FractionallySizedBox

The FractionallySizedBox widget helps to size its child to a fraction of the total available space. It is especially useful inside Expanded or Flexible widgets.

An example is as follows:


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FractionallySizedWidget(widthFactor: 0.4),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FractionallySizedWidget(widthFactor: 0.6),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FractionallySizedWidget(widthFactor: 0.8),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FractionallySizedWidget(widthFactor: 1.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FractionallySizedWidget extends StatelessWidget {
  final double widthFactor;
  FractionallySizedWidget({@required this.widthFactor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: widthFactor,
        child: Container(
          decoration: BoxDecoration(
            color: CustomColors.android,
            border: Border.all(color: Colors.white),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '${widthFactor * 100}%',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}


6. AspectRatio

You can use the AspectRatio widget to size the child to a specific aspect ratio. This widget first tries the largest width permitted by the layout constraints and then decides the height by applying the given aspect ratio to the width.


class HomePage extends StatelessWidget {
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

  AspectRatioWidget({@required this.ratio});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: Fraction.fromString(ratio).toDouble(),
      child: Container(
        decoration: BoxDecoration(
          color: CustomColors.android,
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
