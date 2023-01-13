import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:xchat/constant/music_list.dart';

import 'duration_state.dart';

class SlideMusicPositionBar extends StatelessWidget {
  const SlideMusicPositionBar({
    Key? key,
    required Stream<DurationState> durationStateStream,
    // required this.widget,
  })  : _durationStateStream = durationStateStream,
        super(key: key);

  final Stream<DurationState> _durationStateStream;
  // final ActualPlayingMusicScreen widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider bar container
        Container(
          padding: EdgeInsets.zero,
          margin: const EdgeInsets.only(bottom: 4.0),

          //slider bar duration state stream
          child: StreamBuilder<DurationState>(
            stream: _durationStateStream,
            builder: (context, snapshot) {
              final durationState = snapshot.data;
              final progress = durationState?.position ?? Duration.zero;
              final total = durationState?.total ?? Duration.zero;

              return ProgressBar(
                progress: progress,
                total: total,
                barHeight: 20.0,
                progressBarColor: const Color(0xEE9E9E9E),
                thumbColor: Colors.white60.withBlue(99),
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

        //position /progress and total text
        StreamBuilder<DurationState>(
          stream: _durationStateStream,
          builder: (context, snapshot) {
            final durationState = snapshot.data;
            final progress = durationState?.position ?? Duration.zero;
            final total = durationState?.total ?? Duration.zero;

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: Text(
                    progress.toString().split(".")[0],
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    total.toString().split(".")[0],
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
