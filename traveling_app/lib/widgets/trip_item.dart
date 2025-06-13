// ignore_for_file: dead_code, non_constant_identifier_names, unreachable_switch_default, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:traveling_app/screens/trip_details_screen.dart';
import '../models/trip.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;
  // final Function removeItem;

  const TripItem({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.tripType,
    required this.season,
    // required this.removeItem,
  });

  String get seasonText {
    switch (season) {
      case Season.Winter:
        return 'شتاء';
        break;
      case Season.Spring:
        return 'ربيع';
        break;
      case Season.Summer:
        return 'صيف';
        break;
      case Season.Autumn:
        return 'خريف';
        break;
      default:
        return 'غير معروف';
    }
  }

  String get TripTypeText {
    switch (tripType) {
      case TripType.Exploration:
        return 'استكشاف';
        break;
      case TripType.Recovery:
        return 'نقاهه';
        break;
      case TripType.Activities:
        return 'انشطه';
        break;
      case TripType.Therapy:
        return 'معالجه';
        break;
      default:
        return 'غير معروف';
    }
  }

  void selectTrip(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      TripDetailsScreen.screenRoute,
      arguments: id,
    )
        .then(
      (result) {
        // if (result != null) {
        //   removeItem(result);
        // }
        // ;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(.8),
                      ],
                      stops: const [0.6, 1],
                    ),
                  ),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.today,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 6),
                      Text('$duration أيام')
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.sunny,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 6),
                      Text(seasonText)
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.family_restroom,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 6),
                      Text(TripTypeText)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
