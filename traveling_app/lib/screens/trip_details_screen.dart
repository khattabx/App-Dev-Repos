import 'package:flutter/material.dart';
import '../app_data.dart';

class TripDetailsScreen extends StatelessWidget {
  static const screenRoute = '/trip-detail';

  final Function manageFav;
  final Function isFavorite;
  const TripDetailsScreen(this.manageFav, this.isFavorite);

  //  this widget for main title like الانشطه و البرنامج اليومي.
  Widget buildSectionTitle(BuildContext context, String titleText) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      alignment: Alignment.topRight,
      child: Text(
        titleText,
        style: const TextStyle(
          color: Colors.blue,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // this widget for activities in the box .
  Widget buildListViewContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      padding: EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: child, // Passing the child parameter here
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedTrip = Trips_data.firstWhere((trip) => trip.id == tripId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedTrip.title}'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedTrip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            buildSectionTitle(context, 'الانشطه'),
            buildListViewContainer(
              ListView.builder(
                itemCount: selectedTrip.activities.length,
                itemBuilder: (ctx, index) => Card(
                  elevation: 0.3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      selectedTrip.activities[index],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            buildSectionTitle(context, 'البرنامج اليومي'),
            buildListViewContainer(
              ListView.builder(
                itemCount: selectedTrip.program.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('يوم${index + 1}'),
                      ),
                      title: Text(selectedTrip.program[index]),
                    ),
                    const Divider(color: Colors.black12),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 100)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100))),
        child: Icon(
          isFavorite(tripId)
              ? Icons.favorite_rounded
              : Icons.favorite_outline_rounded,
        ),
        onPressed: () => manageFav(tripId),
      ),
    );
  }
}
