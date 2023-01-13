import 'package:flutter/material.dart';

class MusicItem {
  MusicItem({
    required this.songId,
    required this.songtitle,
    required this.songIndex,
  });

  int songId;
  String songtitle;
  int songIndex;
}

class BottomSceenProvider with ChangeNotifier {
  final Map<String, MusicItem> _items = {};

  Map<String, MusicItem> get items {
    return {..._items};
  }

  void addItem(
    int songId,
    String songtitle,
    int songIndex,
  ) {
    if (_items.containsKey(songId)) {
      _items.clear();
      _items.update(
        songId.toString(),
        (value) => MusicItem(
          songId: 123,
          songtitle: songtitle,
          songIndex: songIndex,
        ),
      );
    } else {
      _items.clear();
      _items.putIfAbsent(
        songId.toString(),
        () => MusicItem(
          songId: 123,
          songtitle: songtitle,
          songIndex: songIndex,
        ),
      );
    }
  }

  void removeItem(String songId) {
    _items.remove(songId);
    notifyListeners();
  }
}
