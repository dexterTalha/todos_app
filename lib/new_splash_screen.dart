import 'package:flutter/material.dart';
import 'package:todos_app/mycolors.dart';

class NewSplashScreen extends StatefulWidget {
  @override
  _NewSplashScreenState createState() => _NewSplashScreenState();
}

class _NewSplashScreenState extends State<NewSplashScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          //background
          Column(
            children: [
              Container(
                height: size.height * 0.4,
                color: Color(0xffd22b24),
              ),
              Expanded(
                child: Container(
                  color: Color(0xffe8e1a7),
                ),
              ),
            ],
          ),
          //foreground

          Positioned(
            top: (size.height * 0.4) - 75,
            right: (size.width * 0.5) - 65,
            child: FlutterLogo(
              size: 150,
            ),
          ),
        ],
      ),
    );
  }
}
