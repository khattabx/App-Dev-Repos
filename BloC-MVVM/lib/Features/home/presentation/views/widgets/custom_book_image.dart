import 'package:bookly/Core/utils/styles.dart';
// import 'package:bookly/Core/widgets/custom_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.5 / 4,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          // placeholder: (context, url) => const Center(
          //   child: CustomLoading(),
          // ),
          errorWidget: (context, url, error) => const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline_rounded, size: 32),
                SizedBox(height: 10),
                Text(
                  'Error Loading Image',
                  style: Styles.textStyle14,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
