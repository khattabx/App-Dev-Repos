// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../consts/colors.dart';
import '../consts/text_style.dart';
import '../controllers/player_controller.dart';
import '../widgets/custom_nav_bar.dart';
import 'player.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double xOffset = 0;
  double yOffset = 0;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlayerController());
    print(controller);

    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(isDrawerOpen ? 0.85 : 1.00)
        ..rotateZ(isDrawerOpen ? -50 : 0),
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: bgDarkColor,
        borderRadius:
            isDrawerOpen ? BorderRadius.circular(40) : BorderRadius.circular(0),
      ),
      child: Scaffold(
        appBar: appBar(),
        // floatingActionButton: FloatBotton(controller: controller),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            CustomNavBar(),
            Expanded(
              child: FutureBuilder<List<SongModel>>(
                future: controller.audioQuery.querySongs(
                  ignoreCase: true,
                  orderType: OrderType.ASC_OR_SMALLER,
                  sortType: null,
                  uriType: UriType.EXTERNAL,
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                      child: Text(
                        'There are no audio files.',
                        style: ourStyle(),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 5),
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  title: Text(
                                    snapshot.data![index].displayNameWOExt,
                                    style: ourStyle(
                                      family: bold,
                                      size: 15,
                                    ),
                                  ),
                                  subtitle: Text(
                                    snapshot.data![index].artist ?? "Unknown",
                                    style: ourStyle(
                                      family: bold,
                                      size: 12,
                                    ),
                                  ),
                                  leading: snapshot.data![index].id != null
                                      ? QueryArtworkWidget(
                                          artworkBorder:
                                              BorderRadius.circular(12),
                                          id: snapshot.data![index].id,
                                          type: ArtworkType.AUDIO,
                                          nullArtworkWidget: const Icon(
                                            Icons.music_note,
                                            color: whiteColor,
                                            size: 50,
                                          ),
                                        )
                                      : const Icon(
                                          Icons.music_note,
                                          color: whiteColor,
                                          size: 50,
                                        ),
                                  onTap: () {
                                    controller.playSong(
                                      snapshot.data![index].uri,
                                      index,
                                    );
                                    Get.to(
                                      () => Player(data: snapshot.data!),
                                      transition: Transition.downToUp,
                                      fullscreenDialog: false,
                                      duration:
                                          const Duration(milliseconds: 700),
                                    );
                                  },
                                ),
                              ),
                              const Divider(
                                color: iconsColor,
                                thickness: 1,
                                indent: 72,
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
              decoration: BoxDecoration(
                color: whiteColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              width: double.infinity,
              height: 70,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () async {
                      List<SongModel> songs =
                          await controller.audioQuery.querySongs(
                        ignoreCase: true,
                        orderType: OrderType.ASC_OR_SMALLER,
                        sortType: null,
                        uriType: UriType.EXTERNAL,
                      );
                      Get.to(
                        () => Player(data: songs),
                        transition: Transition.downToUp,
                        fullscreenDialog: false,
                        duration: const Duration(milliseconds: 700),
                      );
                    },
                    icon: SvgPicture.asset(
                      'assets/icons/waves.svg',
                      width: 90,
                      colorFilter:
                          const ColorFilter.mode(whiteColor, BlendMode.srcIn),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          controller.playPreviousSong();
                        },
                        icon: const Icon(
                          Icons.skip_previous_rounded,
                          color: whiteColor,
                          size: 40,
                        ),
                      ),
                      SizedBox(width: 25),
                      Obx(
                        () => IconButton(
                          onPressed: () {
                            controller.pauseOrResume();
                          },
                          icon: Icon(
                            controller.isPlaying.value
                                ? Icons.pause
                                : Icons.play_arrow_rounded,
                            color: whiteColor,
                            size: 45,
                          ),
                        ),
                      ),
                      SizedBox(width: 25),
                      IconButton(
                        onPressed: () {
                          controller.playNextSong();
                        },
                        icon: const Icon(
                          Icons.skip_next_rounded,
                          color: whiteColor,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          setState(() {
            if (isDrawerOpen) {
              xOffset = 0;
              yOffset = 0;
              isDrawerOpen = false;
            } else {
              xOffset = 290;
              yOffset = 80;
              isDrawerOpen = true;
            }
          });
        },
        icon: isDrawerOpen
            ? const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: iconsColor,
              )
            : SvgPicture.asset(
                width: 20,
                height: 20,
                'assets/icons/drawer.svg',
                colorFilter:
                    const ColorFilter.mode(iconsColor, BlendMode.srcIn),
              ),
      ),
      title: Text(
        'Audira',
        style: TextStyle(
          fontSize: 30,
          color: whiteColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'bold',
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Get.snackbar(
              "In Progress",
              "This feature is currently being developed. Stay tuned!",
              colorText: Colors.white,
              icon: const Icon(Icons.code_rounded, color: Colors.green),
              isDismissible: true,
              animationDuration: const Duration(milliseconds: 400),
            );
          },
          icon: SvgPicture.asset(
            width: 22,
            height: 22,
            'assets/icons/setting.svg',
            colorFilter: const ColorFilter.mode(iconsColor, BlendMode.srcIn),
          ),
        )
      ],
    );
  }
}
