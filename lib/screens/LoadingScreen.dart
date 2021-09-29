import 'package:flutter/material.dart';
import 'package:kiran_demo/screens/HomeScreen.dart';
import 'package:splashscreen/splashscreen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SplashScreen(
        seconds: 6,
        useLoader: false,
        navigateAfterSeconds: HomeScreen(),
        image: Image.network(
          'https://lightwebgroup.com/wp-content/uploads/2020/09/lightweb-group-logo.png',
        ),
        photoSize: 100.0,
      ),
    );
  }
}
