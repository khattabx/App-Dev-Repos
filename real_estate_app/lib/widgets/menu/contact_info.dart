import 'package:flutter/material.dart';
import 'package:real_estate_app/constans.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildContactInfo(
          title: 'Address',
          text: 'Cairo',
        ),
        buildContactInfo(
          title: 'Country',
          text: 'Egypt',
        ),
        buildContactInfo(
          title: 'Email',
          text: 'email@gmail.com',
        ),
        buildContactInfo(
          title: 'Mobile',
          text: '+20 1092604920',
        ),
        buildContactInfo(
          title: 'ًWebsite',
          text: 'my@Website.com',
        )
      ],
    );
  }

  Padding buildContactInfo({required String title, required String text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$title',
            style: const TextStyle(color: Colors.white),
          ),
          Text('$text')
        ],
      ),
    );
  }
}
