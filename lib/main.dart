import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gallery Demo",
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: DisplayPage(),
    );
  }
}

class DisplayPage extends StatelessWidget {
  final List<String> images = [
    "assets/wallpaper-1.jpg",
    "assets/wallpaper-2.jpg",
    "assets/wallpaper-3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox.fromSize(
          size: Size.fromHeight(550.0),
          child: PageView.builder(
            controller: PageController(
              viewportFraction: 0.8,
            ),
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 8.0,
                ),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(8.0),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: FractionalOffset.bottomCenter,
                                end: FractionalOffset.topCenter,
                                colors: [
                              Colors.lightBlue.withOpacity(0.1),
                              Colors.white.withOpacity(0.07),
                              Colors.teal.withOpacity(0.2),
                            ])),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
