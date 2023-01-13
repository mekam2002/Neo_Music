import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';
import 'package:xchat/constant/music_list.dart';

import '../../providers/storage_songs_provider.dart';
import '../../repositories/create_player.dart';

class ArtistScreen extends StatefulWidget {
  const ArtistScreen({super.key});
  static const routeName = "/Artist_screen";

  @override
  State<ArtistScreen> createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen>
    with AutomaticKeepAliveClientMixin<ArtistScreen> {
  @override
  Widget build(BuildContext context) {
    final songData = Provider.of<StorageSongsProvider>(context);
    final userMusic = songData.storageSongs;
    userMusic.sort((a, b) {
      return a.composer.toString().compareTo(
            b.artist.toString(),
          );
    });
    super.build(context);

    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(top: 15.0, left: 12.0, right: 16.0),
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
              setState(() {});
              if (globalPhonePlayer.playing) {
                await globalPhonePlayer.play();
              }
              await globalPhonePlayer.setAudioSource(createPlaylist(userMusic),
                  initialIndex: index);
              await globalPhonePlayer.play();
            },
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
