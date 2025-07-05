// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class PlayerController extends GetxController {
  final audioQuery = OnAudioQuery();
  final audioPlayer = AudioPlayer();

  var playIndex = 0.obs;
  var isPlaying = false.obs;

  var duration = ''.obs;
  var position = ''.obs;

  var max = 0.0.obs;
  var value = 0.0.obs;

  var isLoading = true.obs;
  List<SongModel> data = [];

  @override
  void onInit() {
    super.onInit();
    checkPermission();
    loadSongs();
    audioPlayer.positionStream.listen((position) {
      if (audioPlayer.duration != null && position >= audioPlayer.duration!) {
        playNextSong();
      }
    });
  }

  Future<void> loadSongs() async {
    var perm = await Permission.storage.request();
    if (perm.isGranted) {
      var songs = await audioQuery.querySongs();
      data = songs.isNotEmpty ? songs : [];
    } else {
      print("Permission denied!");
    }
    isLoading(false); 
  }

  // _playNextSong() {
  //   if (playIndex.value < data.length - 1) {
  //     playSong(data[playIndex.value + 1].uri, playIndex.value + 1);
  //   } else {
  //     playSong(data[0].uri, 0);
  //   }
  // }

  updatePosition() {
    audioPlayer.durationStream.listen((d) {
      if (d != null) {
        duration.value = d.toString().split(".")[0];
        max.value = d.inSeconds.toDouble();
      } else {
        duration.value = "0:00";
        max.value = 0.0;
      }
    });

    audioPlayer.positionStream.listen((p) {
      if (p != null) {
        position.value = p.toString().split(".")[0];
        value.value = p.inSeconds.toDouble();
      } else {
        position.value = "0:00";
        value.value = 0.0;
      }
    });
  }

  playSong(String? uri, int index) async {
    playIndex.value = index;
    try {
      await audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(uri!)));
      await audioPlayer.play();
      isPlaying(true);
      updatePosition();
    } on Exception catch (e) {
      print("Error loading song: $e");
      if (index < data.length - 1) {
        playSong(data[index + 1].uri, index + 1);
      } else {
        playSong(data[0].uri, 0);
      }
    }
  }

  void playNextSong() {
  if (playIndex.value < data.length - 1) {
    playSong(data[playIndex.value + 1].uri, playIndex.value + 1);
  } else {
    playSong(data[0].uri, 0);
  }
}

void playPreviousSong() {
  if (playIndex.value > 0) {
    playSong(data[playIndex.value - 1].uri, playIndex.value - 1);
  } else {
    playSong(data[data.length - 1].uri, data.length - 1);
  }
}


  pauseOrResume() {
    if (audioPlayer.playing) {
      audioPlayer.pause();
      isPlaying(false);
    } else {
      audioPlayer.play();
      isPlaying(true);
    }
  }

  checkPermission() async {
    var perm = await Permission.storage.request();
    if (!perm.isGranted) {
      checkPermission();
    }
  }
}
