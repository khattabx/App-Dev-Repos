import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../consts/colors.dart';
import '../controllers/player_controller.dart';
import '../pages/player.dart';

class FloatBotton extends StatelessWidget {
  const FloatBotton({
    super.key,
    required this.controller,
  });

  final PlayerController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () async {
          List<SongModel> songs = await controller.audioQuery.querySongs(
            ignoreCase: true,
            orderType: OrderType.ASC_OR_SMALLER,
            sortType: null,
            uriType: UriType.EXTERNAL,
          );
          if (songs.isEmpty) {
            Get.snackbar(
              'Error',
              'No songs available!',
              colorText: Colors.white,
              icon: const Icon(
                Icons.report_gmailerrorred_rounded,
                color: Colors.red,
              ),
              isDismissible: true,
              animationDuration: const Duration(milliseconds: 400),
            );
          } else {
            Get.to(
              () => Player(data: songs),
              transition: Transition.downToUp,
              fullscreenDialog: false,
              duration: const Duration(milliseconds: 700),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(
            'assets/icons/waves.svg',
            width: 200,
            height: 200,
            colorFilter: const ColorFilter.mode(whiteColor, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
