import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../consts/colors.dart';
import '../consts/text_style.dart';
import '../controllers/player_controller.dart';
import '../widgets/circle_painter.dart';

class Player extends StatelessWidget {
  final List<SongModel> data;
  const Player({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var conteoller = Get.find<PlayerController>();
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 66, 96),
                Color.fromARGB(255, 0, 10, 24),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: whiteColor,
                      size: 50,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Obx(
                () => Stack(
                  alignment: Alignment.center,
                  children: [
                    Obx(
                      () => CustomPaint(
                        size: const Size(350, 350),
                        painter: CirclePainter(
                            progress:
                                conteoller.value.value / conteoller.max.value),
                      ),
                    ),
                    ClipOval(
                      child: Container(
                        height: 300,
                        width: 300,
                        alignment: Alignment.center,
                        child: QueryArtworkWidget(
                          id: data[conteoller.playIndex.value].id,
                          type: ArtworkType.AUDIO,
                          artworkHeight: double.infinity,
                          artworkWidth: double.infinity,
                          nullArtworkWidget: const Icon(
                            Icons.music_note,
                            size: 50,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  alignment: Alignment.center,
                  child: Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          data[conteoller.playIndex.value].displayNameWOExt,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: ourStyle(
                            color: whiteColor,
                            family: bold,
                            size: 24,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          data[conteoller.playIndex.value].artist.toString(),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: ourStyle(
                            color: whiteColor,
                            family: regular,
                            size: 18,
                          ),
                        ),
                        const SizedBox(height: 35),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed: () {
                                if (conteoller.playIndex.value > 0) {
                                  conteoller.playSong(
                                    data[conteoller.playIndex.value - 1].uri,
                                    conteoller.playIndex.value - 1,
                                  );
                                } else {
                                  conteoller.playSong(
                                    data[data.length - 1].uri,
                                    data.length - 1,
                                  );
                                }
                              },
                              icon: const Icon(
                                Icons.skip_previous_rounded,
                                size: 60,
                                color: whiteColor,
                              ),
                            ),
                            Obx(
                              () => CircleAvatar(
                                radius: 35,
                                backgroundColor: whiteColor,
                                child: Transform.scale(
                                  scale: 1,
                                  child: IconButton(
                                    onPressed: () {
                                      if (conteoller.isPlaying.value) {
                                        conteoller.audioPlayer.pause();
                                        conteoller.isPlaying(false);
                                      } else {
                                        conteoller.audioPlayer.play();
                                        conteoller.isPlaying(true);
                                      }
                                    },
                                    icon: conteoller.isPlaying.value
                                        ? const Icon(
                                            Icons.pause,
                                            size: 55,
                                            color: bgDarkColor,
                                          )
                                        : const Icon(
                                            Icons.play_arrow_rounded,
                                            size: 55,
                                            color: bgDarkColor,
                                          ),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                if (conteoller.playIndex.value <
                                    data.length - 1) {
                                  conteoller.playSong(
                                    data[conteoller.playIndex.value + 1].uri,
                                    conteoller.playIndex.value + 1,
                                  );
                                } else {
                                  print("You are at the last song.");
                                  conteoller.playSong(data[0].uri, 0);
                                }
                              },
                              icon: const Icon(
                                Icons.skip_next_rounded,
                                size: 60,
                                color: whiteColor,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
