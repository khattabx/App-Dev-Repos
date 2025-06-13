import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveling_app/app_data.dart';
import 'package:traveling_app/generated/l10n.dart';
import './models/trip.dart';
import './screens/filters_screen.dart';
import './screens/categories_trips_screen.dart';
import './screens/tabs_screen.dart';
import './screens/trip_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };

  List<Trip> _availableTrips = Trips_data;
  List<Trip> _favoriteTrips = [];

  void _changeFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableTrips = Trips_data.where((trip) {
        if (_filters['summer'] == true && trip.isInSummer != true) {
          return false;
        }
        if (_filters['winter'] == true && trip.isInWinter != true) {
          return false;
        }
        if (_filters['family'] == true && trip.isForFamilies != true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _manageFav(String tripId) {
    final existingIndex =
        _favoriteTrips.indexWhere((trip) => trip.id == tripId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteTrips.remove(existingIndex);
      });
    } else {
      setState(() {
        _favoriteTrips.add(Trips_data.firstWhere((trip) => trip.id == tripId));
      });
    }
  }

  bool _isFovrite(String id) {
    return _favoriteTrips.any((trip) => trip.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: ThemeData(
        primaryColor: Colors.blue,
        textTheme: GoogleFonts.rubikTextTheme(),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          centerTitle: true,
          titleTextStyle: GoogleFonts.rubik(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favoriteTrips),
        CategoriesTripsScreen.screenRoute: (ctx) =>
            CategoriesTripsScreen(_availableTrips),
        TripDetailsScreen.screenRoute: (ctx) => TripDetailsScreen(_manageFav, _isFovrite),
        FiltersScreen.screenRoute: (ctx) =>
            FiltersScreen(_filters, _changeFilters),
      },
    );
  }
}
