import 'package:boilerplate/presentation/pages/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  void initState() {
    _screens = [
      const HomeScreen(),
      const ProfileScreen(),
      const ProfileScreen(),
      const ProfileScreen()
    ];
    _appBarTitle = [
      "Home",
      "Cart",
      "Category",
      "Profile"
    ];
    _appBarTitle[_currentBottomNavigationBarIndex];
    super.initState();
  }

  late List<Widget> _screens;
  late List<String> _appBarTitle;
  int _currentBottomNavigationBarIndex = 0;


  void onNavigationBarItemTap(int value) {

    switch (value) {
      case 0:
        setState(() {
          _currentBottomNavigationBarIndex = value;
        });
        break;
      case 1:
        setState(() {
          _currentBottomNavigationBarIndex = value;
        });
        break;
      case 2:
        setState(() {
          _currentBottomNavigationBarIndex = value;
        });
        break;
      case 3:
        setState(() {
          _currentBottomNavigationBarIndex = value;
        });
        break;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_appBarTitle[_currentBottomNavigationBarIndex]),
      ),
      body: _screens[_currentBottomNavigationBarIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentBottomNavigationBarIndex,
        onTap: (value) {
          onNavigationBarItemTap(value);
        },
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),

        ],
      ),
    );
  }
}
