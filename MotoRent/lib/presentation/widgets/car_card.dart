import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:motorent/data/models/car.dart';
import 'package:motorent/presentation/pages/car_details_page.dart';

class CarCard extends StatelessWidget {
  final Car car;
  const CarCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) =>
                CarDetailsPage(car: car),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var tween = Tween(begin: Offset(1.0, 0.0), end: Offset.zero)
                  .chain(CurveTween(curve: Curves.easeInOut));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xffF3F3F3),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'NEAREST CARS',
                style: TextStyle(
                  letterSpacing: 2.5,
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  color: Colors.grey[600],
                ),
              ),
            ),
            Image.asset(height: 120, 'assets/images/car_image.png'),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                car.model,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/images/gps.svg'),
                        SizedBox(width: 2),
                        Text('${car.distance.toStringAsFixed(0)}km')
                      ],
                    ),
                    SizedBox(width: 20),
                    Row(
                      children: [
                        SvgPicture.asset('assets/images/pump.svg'),
                        SizedBox(width: 2),
                        Text('${car.fuelCapacity.toStringAsFixed(0)}L')
                      ],
                    ),
                  ],
                ),
                Text(
                  '\$${car.pricePerHour.toStringAsFixed(2)}/h',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
