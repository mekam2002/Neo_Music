import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:xchat/providers/botton_item.dart';

import '../constant/music_list.dart';
import '../providers/storage_songs_provider.dart';
import '../widgets/duration_state.dart';

class BottomMusicPlayerSheet extends StatefulWidget {
  const BottomMusicPlayerSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomMusicPlayerSheet> createState() => _BottomMusicPlayerSheetState();
}

class _BottomMusicPlayerSheetState extends State<BottomMusicPlayerSheet> {
  Stream<DurationState> get _durationStateStream =>
      Rx.combineLatest2<Duration, Duration?, DurationState>(
          globalPhonePlayer.positionStream,
          globalPhonePlayer.durationStream,
          (position, duration) => DurationState(
              position: position, total: duration ?? Duration.zero));

  @override
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<BottomSceenProvider>(context);
    final songData = Provider.of<StorageSongsProvider>(
      context,
      listen: false,
    );

    final _userMusic = songData.storageSongs;
    int userId = cart.items.values.toList()[0].songIndex;
    String usertitle = cart.items.values.toList()[0].songtitle;
    int userIndex = cart.items.values.toList()[0].songIndex;

    return FractionallySizedBox(
      // heightFactor: 1,
      child: Scaffold(
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //
              // music image
              SizedBox(
                  height: 200,
                  width: 200,
                  child: QueryArtworkWidget(
                    id: _userMusic[userId].id,
                    type: ArtworkType.AUDIO,
                    artworkBorder: BorderRadius.circular(200.0),
                  )),
              //
              //
              // music title and favorites button

              Center(
                child:
                    //
                    Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(
                          usertitle,
                          // overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          maxLines: 1,
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            if (favoriteList.contains(
                              _userMusic[userIndex],
                            )) {
                            } else {
                              favoriteList.add(
                                _userMusic[userIndex],
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  content: Text(
                                    "added to favorites",
                                  ),
                                ),
                              );
                            }
                          },
                          icon: const Icon(
                            Icons.favorite_outline_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                children: [
                  Container(
                    padding: EdgeInsets.zero,
                    margin: const EdgeInsets.only(bottom: 4.0),

                    //slider bar duration state stream
                    child: StreamBuilder<DurationState>(
                      stream: _durationStateStream,
                      builder: (context, snapshot) {
                        final durationState = snapshot.data;
                        final progress =
                            durationState?.position ?? Duration.zero;
                        final total = durationState?.total ?? Duration.zero;

                        return ProgressBar(
                          progress: progress,
                          total: total,
                          barHeight: 5.0,
                          baseBarColor: const Color.fromARGB(255, 82, 82, 82),
                          progressBarColor: Colors.white,
                          thumbColor: Colors.white.withBlue(9),
                          timeLabelTextStyle: const TextStyle(
                            fontSize: 0,
                          ),
                          onSeek: (duration) {
                            globalPhonePlayer.seek(duration);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              //
              //
              // progres Indicator
              StreamBuilder<DurationState>(
                stream: _durationStateStream,
                builder: (context, snapshot) {
                  final durationState = snapshot.data;
                  final progress = durationState?.position ?? Duration.zero;
                  final total = durationState?.total ?? Duration.zero;

                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // duree initial
                        Flexible(
                          child: Text(
                            progress.toString().split(".")[0],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        //
                        // duree finale
                        Flexible(
                          child: Text(
                            total.toString().split(".")[0],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              //
              //
              //
              // control panelButton
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //
                  // shuflle
                  IconButton(
                    onPressed: () {
                      globalPhonePlayer.setShuffleModeEnabled(true);
                    },
                    icon: const Icon(
                      Icons.shuffle,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),

                  //
                  // next button
                  IconButton(
                    onPressed: () async {
                      if (globalPhonePlayer.hasPrevious) {
                        globalPhonePlayer.seekToPrevious();
                      }
                    },
                    icon: const Icon(
                      Icons.skip_previous_sharp,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  StreamBuilder(
                    stream: globalPhonePlayer.playingStream,
                    builder: ((context, snapshot) {
                      bool? playingState = snapshot.data;

                      return IconButton(
                        onPressed: () async {
                          if (globalPhonePlayer.playing) {
                            globalPhonePlayer.pause();
                          } else {
                            if (globalPhonePlayer.currentIndex != null) {
                              globalPhonePlayer.play();
                            }
                          }
                        },
                        icon: (playingState != null && playingState)
                            ? const Icon(
                                Icons.pause,
                                size: 40,
                                color: Colors.white,
                              )
                            : const Icon(
                                Icons.play_arrow,
                                size: 30,
                                color: Colors.white,
                              ),
                      );
                    }),
                  ),
                  IconButton(
                    onPressed: () {
                      if (globalPhonePlayer.hasNext) {
                        globalPhonePlayer.seekToNext();
                      }
                    },
                    icon: const Icon(
                      Icons.skip_next,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.my_library_music_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
