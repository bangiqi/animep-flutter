import 'package:animep_flutter/feature/about/views/about_screen.dart';
import 'package:animep_flutter/feature/base/components/custom_appbar.dart';
import 'package:animep_flutter/feature/home/views/home_screen.dart';
import 'package:animep_flutter/feature/manga/views/manga_screen.dart';
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
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen('Home'),
    MangaScreen('Manga'),
    AboutScreen('About'),
  ];

  static List<String> _titleMenus = <String>['anime', 'manga', 'about'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Main TabBar',
      theme: ThemeData(primaryColor: Colors.red),
      home: Scaffold(
        appBar: CustomAppBar(
          title: _titleMenus.elementAt(_selectedIndex),
          isDetail: false,
          context: context,
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Anime'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.import_contacts), label: 'Manga'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.contact_page), label: 'About'),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.red[600],
            onTap: _onItemTapped),
      ),
    );
  }
}
