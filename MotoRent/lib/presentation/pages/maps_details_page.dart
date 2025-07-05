import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:motorent/data/models/car.dart';
import 'package:motorent/presentation/widgets/toast_helper.dart';

class MapsDetailsPage extends StatelessWidget {
  const MapsDetailsPage({super.key, required this.car});
  final Car car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ToastHelper.showTopNotification(
                context,
                "This feature is under development!",
              );
            },
            icon: Icon(
              CupertinoIcons.slider_horizontal_3,
              size: 30,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              // location of the map [Alexandria]
              initialCenter: LatLng(31.2001, 29.9187),
              initialZoom: 14.0,
              maxZoom: 18.0,
              minZoom: 10.0,
              onTap: (tapPosition, point) {
                debugPrint("Tapped at ${point.latitude}, ${point.longitude}");
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CarDetailsCard(car: car),
          ),
        ],
      ),
    );
  }
}

class CarDetailsCard extends StatelessWidget {
  const CarDetailsCard({super.key, required this.car});
  final Car car;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Color(0xff282931),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 5,
                  blurRadius: 15,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    ToastHelper.showTopNotification(
                      context,
                      "Not Now :)",
                    );
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0xff45454B),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        Icons.clear_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Text(
                  car.model,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SvgPicture.asset('assets/images/gps.svg'),
                    SizedBox(width: 5),
                    Text(
                      '> ${car.distance}km',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(width: 10),
                    SvgPicture.asset('assets/images/pump.svg'),
                    SizedBox(width: 5),
                    Text(
                      '> ${car.fuelCapacity}L',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 5,
                    blurRadius: 15,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Features',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 10),
                  featureIcons(),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$${car.pricePerHour * 24}',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '/day',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        child: ElevatedButton(
                          onPressed: () {
                            ToastHelper.showTopNotification(
                              context,
                              "Booking is under development!",
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black,
                          ),
                          child: Text(
                            'Book Now',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 52,
            right: 10,
            child: Image.asset(
              'assets/images/white_car.png',
              // width: 100,
              height: 130,
            ),
          ),
        ],
      ),
    );
  }
}

Widget featureIcons() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        featureIcon(
            Icons.local_gas_station, 'Diesel', 'Common Rail Fuel Injection'),
        SizedBox(width: 20),
        featureIcon(Icons.speed, 'Acceleration', '0 - 100km/ 11s'),
        SizedBox(width: 20),
        featureIcon(Icons.ac_unit, 'Cool Seat', 'Temp Control on seat'),
      ],
    ),
  );
}

Widget featureIcon(IconData icon, String title, String subtitle) {
  return Container(
    width: 150,
    height: 100,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300, width: 1)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 42,
        ),
        Text(title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
        Text(
          subtitle,
          style: TextStyle(color: Colors.grey, fontSize: 10),
        )
      ],
    ),
  );
}
