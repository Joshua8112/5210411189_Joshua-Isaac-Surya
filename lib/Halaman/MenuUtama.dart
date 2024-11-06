import 'package:flutter/material.dart';
import 'package:tml/Halaman/Home.dart';
import 'package:tml/Halaman/Profile.dart';

class MenuUtama extends StatefulWidget {
  @override
  _MenuUtamaState createState() => _MenuUtamaState();
}

class _MenuUtamaState extends State<MenuUtama> {
  int _selectedIndex = 0;

  // List of widgets for each page, excluding the logout page
  final List<Widget> _pages = [
    Home(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      // Navigate to the login page when the logout button is tapped
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      // Update the selected index to show the corresponding page
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Show the selected page
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Akun',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
        currentIndex: _selectedIndex, // Set the current selected index
        selectedItemColor: Colors.blue, // Color for selected item
        onTap: _onItemTapped, // Handle item tap
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MenuUtama(),
  ));
}
