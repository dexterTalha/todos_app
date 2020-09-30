import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 6,
        title: Text(
          "Todo App",
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
              icon: Icon(
                Icons.refresh,
                semanticLabel: "Refresh",
                size: 38,
              ),
              onPressed: () {
                print("refresh");
              },
            ),
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Text("WELCOME"),
        ),
      ),
    );
  }
}
