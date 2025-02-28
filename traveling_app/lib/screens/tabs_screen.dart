import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widgets/app_drawer.dart';
import './categories_screen.dart';
import './fav_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Trip> favoriteTrips;
  TabsScreen(this.favoriteTrips);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectedScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  int _selectedScreenIndex = 0;

  late List<Map<String, Object>> _screens;
  @override
  void initState() {
    _screens = [
      {
        'Screen': const CategoriesScreen(),
        'Title': ' تصنيفات الرحلات',
      },
      {
        'Screen': FavScreen(widget.favoriteTrips),
        'Title': 'الرحلات المفضله',
      }
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['Title'] as String),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const AppDrawer(),
      body: _screens[_selectedScreenIndex]['Screen'] as Widget,
      bottomNavigationBar: Container(
        height: 70,
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(0)),
          child: BottomNavigationBar(
            onTap: _selectedScreen,
            backgroundColor: Theme.of(context).primaryColor,
            selectedItemColor: Colors.amber,
            unselectedItemColor: Colors.white,
            currentIndex: _selectedScreenIndex,
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard), label: 'التصنيفات'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_rounded), label: 'المفضله'),
            ],
          ),
        ),
      ),
    );
  }
}
