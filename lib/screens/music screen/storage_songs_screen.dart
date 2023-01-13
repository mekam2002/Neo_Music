import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';
import 'package:xchat/providers/botton_item.dart';
import 'package:xchat/providers/storage_songs_provider.dart';

import '../../constant/music_list.dart';
import '../../repositories/create_player.dart';

class StorageSongsScreen extends StatefulWidget {
  const StorageSongsScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = "/StorageSongsScreen_screen";

  @override
  State<StorageSongsScreen> createState() => _StorageSongsScreenState();
}

class _StorageSongsScreenState extends State<StorageSongsScreen>
    with AutomaticKeepAliveClientMixin<StorageSongsScreen> {
  //define on audio plugin

  //dispose the player when done
  @override
  void dispose() {
    globalPhonePlayer.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final songData = Provider.of<StorageSongsProvider>(
      context,
      listen: false,
    );
    final bottomMusic = Provider.of<BottomSceenProvider>(
      context,
      listen: false,
    );
    final userMusic = songData.storageSongs;
    super.build(context);
    if (!autorisationAcces) {
      return const Center(
        child: Text(
          "Allow Acces",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      );
    } else {
      return Column(
        children: [
          SizedBox(
            child: ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.play_circle_fill_outlined,
                  color: Colors.purple,
                ),
              ),
              title: Text(
                "Shuffle Playback",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.filter_2_sharp),
              ),
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: userMusic.length,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      const EdgeInsets.only(top: 15.0, left: 12.0, right: 16.0),
                  child: ListTile(
                    textColor: Colors.white,
                    title: Text(
                      userMusic[index].title,
                      maxLines: 1,
                    ),
                    subtitle: Text(
                      userMusic[index].displayName.split("-")[0],
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
                      id: userMusic[index].id,
                      type: ArtworkType.AUDIO,
                    ),
                    onTap: () async {
                      bottomMusic.addItem(
                        userMusic[index].id,
                        userMusic[index].title,
                        index,
                      );
                      if (globalPhonePlayer.playing) {
                        await globalPhonePlayer.play();
                      }
                      await globalPhonePlayer.setAudioSource(
                          createPlaylist(userMusic),
                          initialIndex: index);
                      await globalPhonePlayer.play();
                      // setState(() {
                      //   containerIndex = index;
                      // });
                      debugPrint("admfaimfoiemf");
                    },
                  ),
                );
              },
            ),
          ),
        ],
      );
    }
  }

  @override
  bool get wantKeepAlive => true;
}
