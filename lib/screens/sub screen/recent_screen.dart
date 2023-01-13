import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:xchat/constant/music_list.dart';

import '../../repositories/create_player.dart';

class RecentScreen extends StatefulWidget {
  const RecentScreen({super.key});
  static const routeName = "/Recent_screen";

  @override
  State<RecentScreen> createState() => _RecentScreenState();
}

class _RecentScreenState extends State<RecentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 39, 39, 39),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
        elevation: 0.1,
        title: const Text(
          "Recent",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: recentList.length,
        itemBuilder: (context, index) {
          return ListTile(
            textColor: Colors.white,
            title: Text(
              playList[index].title,
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
          );
        },
      ),
    );
  }
}
