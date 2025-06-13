import 'package:flutter/material.dart';
import 'package:real_estate_app/constans.dart';
import 'package:real_estate_app/models/recommendation.dart';

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({
    super.key,
    required this.recommendation,
  });
  final Recommendation recommendation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(kDefaultPadding),
      color: kSecondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(recommendation.image!),
            ),
            title: Text(
              recommendation.name!,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            subtitle: Text(
              recommendation.source!,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            recommendation.text!,
            maxLines: 4,
            style: const TextStyle(height: 1.5),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
