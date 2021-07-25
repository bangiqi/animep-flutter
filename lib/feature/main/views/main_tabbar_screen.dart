import 'package:animep_flutter/feature/home/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainTabBarScreen extends StatefulWidget {
  MainTabBarScreen(this.title);
  final String title;

  @override
  _MainTabBarState createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBarScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.normal);

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen('Home'),
    Text(
      'Manga',
      style: optionStyle,
    ),
    Text(
      'About',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Main TabBar',
      theme: ThemeData(primaryColor: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Anime'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.business), label: 'Manga'),
              BottomNavigationBarItem(icon: Icon(Icons.school), label: 'About'),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped),
      ),
    );
  }
}
