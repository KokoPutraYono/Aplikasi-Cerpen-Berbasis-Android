import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uts/dassboard/info.dart';
import 'package:uts/views/create.dart';
import 'package:uts/views/home.dart';

class HeadAdmin extends StatefulWidget {
  const HeadAdmin({Key? key}) : super(key: key);
  @override
  _HeadAdminState createState() => _HeadAdminState();
}

class _HeadAdminState extends State {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CreateUserScreen(),
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
              FontAwesomeIcons.plus,
              size: 25,
            ),
            label: 'Buat Cerpen',
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
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.orangeAccent,
        onTap: _onItemTapped,
        selectedLabelStyle: const TextStyle(fontSize: 14),
      ),
    );
  }
}
