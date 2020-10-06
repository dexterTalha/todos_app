import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todos_app/todomodel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<TodoModel> list = [], tempList = [];
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    getTodoData().then((v) {
      tempList = v;
    });
  }

  Future<List<TodoModel>> getTodoData() async {
    list = [];
    final String url = "http://jsonplaceholder.typicode.com/todos/";
    final dio = Dio();
    Response response = await dio.get(url);

    for (Map<String, dynamic> m in response.data) {
      TodoModel d = TodoModel.fromJson(m);
      list.add(d);
    }
    setState(() {
      isLoaded = true;
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black54,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text("Home"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text("Offer"),
            icon: Icon(Icons.local_offer),
          ),
          BottomNavigationBarItem(
            title: Text("Lists"),
            icon: Icon(Icons.list),
          ),
          BottomNavigationBarItem(
            title: Text("Profile"),
            icon: Icon(Icons.person_pin),
          ),
        ],
      ),
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
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: FlutterLogo(
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Tranzita",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
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
      body: !isLoaded
          ? Container(
              child: Center(
              child: CupertinoActivityIndicator(),
            ))
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (_, index) {
                TodoModel d = list[index];
                tempList.add(d);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onLongPress: () {
                      setState(() {
                        tempList.remove(d);
                      });
                    },
                    child: Card(
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${d.title}"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${d.id}"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${d.completed}"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${d.userId}"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
