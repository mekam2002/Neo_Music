import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/music_list.dart';
import '../../providers/storage_songs_provider.dart';

class GlobalSnackBarPlayer extends StatefulWidget {
  const GlobalSnackBarPlayer({
    super.key,
  });

  @override
  State<GlobalSnackBarPlayer> createState() => _GlobalSnackBarPlayerState();
}

class _GlobalSnackBarPlayerState extends State<GlobalSnackBarPlayer>
    with AutomaticKeepAliveClientMixin<GlobalSnackBarPlayer> {
  @override
  Widget build(BuildContext context) {
    final songData = Provider.of<StorageSongsProvider>(
      context,
      listen: false,
    );

    final userMusic = songData.storageSongs;
    super.build(context);
    String songTitle = userMusic[containerIndex].title;
    return Container(
      height: 50,
      color: Theme.of(context).canvasColor,
      child: ListTile(
        textColor: Colors.white,
        leading: const Icon(
          Icons.multitrack_audio_sharp,
        ),
        title: Text(
          songTitle,
          maxLines: 1,
        ),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  if (globalPhonePlayer.playing) {
                    setState(() {
                      globalPhonePlayer.pause();
                    });
                  }
                  globalPhonePlayer.play();
                  debugPrint(userMusic[containerIndex].title);
                },
                icon: globalPhonePlayer.playing
                    ? const Icon(
                        Icons.pause,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.play_circle_outline_outlined,
                        color: Colors.white,
                      ),
              ),
              IconButton(
                onPressed: () {
                  if (globalPhonePlayer.hasNext) {
                    globalPhonePlayer.seekToNext();
                  }
                },
                icon: const Icon(
                  Icons.skip_next_rounded,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
