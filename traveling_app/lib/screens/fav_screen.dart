import 'package:flutter/material.dart';
import '../widgets/trip_item.dart';
import '../models/trip.dart';

class FavScreen extends StatelessWidget {
  // const FavScreen({super.key});

  final List<Trip> favoriteTrips;
  FavScreen(this.favoriteTrips);

  @override
  Widget build(BuildContext context) {
    if (favoriteTrips.isEmpty) {
      return const Center(
        child: Text('ليس ليدك اي رحله في قائمه المفضله'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            id: favoriteTrips[index].id,
            title: favoriteTrips[index].title,
            imageUrl: favoriteTrips[index].imageUrl,
            duration: favoriteTrips[index].duration,
            tripType: favoriteTrips[index].tripType,
            season: favoriteTrips[index].season,
            // removeItem: _removeTrip,
          );
        },
        itemCount: favoriteTrips.length,
      );
    }
  }
}
