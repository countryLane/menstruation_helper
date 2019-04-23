import 'package:flutter/material.dart';
import 'package:menstruation_helper/tabs/first.dart';
import 'package:menstruation_helper/tabs/second.dart';
import 'package:menstruation_helper/tabs/settings.dart';

void main() {
  runApp(new MaterialApp(title: "MenstruationHelper", home: new MyHome()));
}

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => new MyHomeState();
}

// SingleTickerProviderStateMixin is used for animation
class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  final _widgets = [
    new FirstTab(),
    new SecondTab(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("MenstruationHelper"),
        backgroundColor: Colors.pink[300],
      ),
      body: _widgets.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            backgroundColor: Colors.pink[300]),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            title: Text('Analyze'),
            backgroundColor: Colors.purpleAccent,
          )
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.shifting,
        iconSize: 25.0,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      drawer: new Settings(),
    );
  }
}
