import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.green,
              child: SafeArea(
                  child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: FlutterLogo(
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                  Text("User name"),
                ],
              )),
            ),
          ],
        ),
      ),
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
