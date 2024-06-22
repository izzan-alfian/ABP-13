import 'package:flutter/material.dart';
import 'main.dart';
import 'tutorial_11-2.dart'; // Import Tutorial112Page

class Tutorial11Page extends StatefulWidget {
  const Tutorial11Page({Key? key}) : super(key: key);

  @override
  _Tutorial11PageState createState() => _Tutorial11PageState();
}

class _Tutorial11PageState extends State<Tutorial11Page> {
  int _selectedIndex = 0;

  // Function to handle bottom navigation bar item selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 1) {
      // Navigate to Email page when Email icon is tapped
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Tutorial11_2Page()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tutorial 11-1"),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyApp()),
            );
          },
          child: Text(
            "Go to Home page",
            style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email),
            label: 'Email',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
