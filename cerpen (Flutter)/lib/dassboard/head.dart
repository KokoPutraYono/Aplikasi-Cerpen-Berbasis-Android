import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uts/dassboard/dassboard.dart';
import 'package:uts/dassboard/detail.dart';
import 'package:uts/dassboard/info.dart';
import 'package:uts/models/model.dart';
import 'package:uts/viewmodels/user_vm.dart';

class Head extends StatefulWidget {
  const Head({Key? key}) : super(key: key);
  @override
  _HeadState createState() => _HeadState();
}

class _HeadState extends State {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Dassboard(),
    Info(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.teal,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.house,
              size: 22,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.circleInfo,
              size: 22,
            ),
            label: 'Info',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orangeAccent,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
        selectedLabelStyle: const TextStyle(fontSize: 14),
      ),
    );
  }
}
