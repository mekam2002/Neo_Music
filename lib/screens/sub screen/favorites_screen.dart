import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:xchat/constant/music_list.dart';

import '../../repositories/create_player.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});
  static const routeName = "/favorite_screen";

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 39, 39, 39),
          elevation: 0.1,
          title: const Text(
            "Favorites",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: favoriteList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.only(top: 15.0, left: 12.0, right: 16.0),
              child: Dismissible(
                key: Key(
                  favoriteList[index].id.toString(),
                ),
                background: Container(
                  alignment: Alignment.centerRight,
                  color: Colors.white,
                  child: const Icon(
                    Icons.remove,
                    size: 40,
                  ),
                ),
                direction: DismissDirection.endToStart,
                onDismissed: ((direction) => favoriteList.remove(
                      favoriteList[index],
                    )),
                child: ListTile(
                  textColor: Colors.white,
                  title: Text(
                    favoriteList[index].title,
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    favoriteList[index].displayName.split("-")[0],
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.white60,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.white60,
                    ),
                  ),
                  leading: QueryArtworkWidget(
                    id: favoriteList[index].id,
                    type: ArtworkType.AUDIO,
                  ),
                  onTap: () async {
                    setState(() {
                      containerIndex = index;
                      debugPrint("Bonsoirrrrrrrrrrrrrrrrrrrrrrrrrrrr");
                      debugPrint(
                        containerIndex.toString(),
                      );
                    });
                    if (globalPhonePlayer.playing) {
                      await globalPhonePlayer.play();
                    }
                    await globalPhonePlayer.setAudioSource(
                        createPlaylist(favoriteList as List<SongModel>),
                        initialIndex: index);
                    await globalPhonePlayer.play();
                  },
                ),
              ),
            );
          },
        ));
  }
}
