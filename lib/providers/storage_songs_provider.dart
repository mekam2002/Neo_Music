import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:xchat/constant/music_list.dart';

import '../repositories/create_player.dart';

class StorageSongsProvider with ChangeNotifier {
  final List<SongModel> _storageSongs = songs.cast<SongModel>();

  List<SongModel> get storageSongs {
    return [..._storageSongs];
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }

  SongModel findById(int id) {
    return _storageSongs.firstWhere((element) => element.id == id);
  }

  void playMusic(int index) async {
    if (globalPhonePlayer.playing) {
      await globalPhonePlayer.play();
    }
    await globalPhonePlayer.setAudioSource(createPlaylist(songs),
        initialIndex: index);
    await globalPhonePlayer.play();
    notifyListeners();
  }
}
