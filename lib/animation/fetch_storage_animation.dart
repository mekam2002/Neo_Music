import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:xchat/screens/screen%20tab%20controller/bottom_tab_controller.dart';

import '../constant/music_list.dart';

class FetchStorageAnimation extends StatefulWidget {
  const FetchStorageAnimation({super.key});
  static const routeName = "/FetchStorageAnimation_screen";

  @override
  State<FetchStorageAnimation> createState() => _FetchStorageAnimationState();
}

class _FetchStorageAnimationState extends State<FetchStorageAnimation> {
  bool selected = false;
  final OnAudioQuery _audioQuery = OnAudioQuery();
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();

    // requestStoragePermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 238, 108, 151),
              Color.fromARGB(255, 235, 170, 73),
            ],
          ),
        ),
        child: Center(
          child: FutureBuilder<List<SongModel>>(
              //default values
              future: _audioQuery.querySongs(
                orderType: OrderType.ASC_OR_SMALLER,
                uriType: UriType.EXTERNAL,
                ignoreCase: true,
              ),
              builder: (context, item) {
                //loading content indicator
                if (item.data == null) {
                  songs = [];
                  songs.clear();
                }
                //no songs found
                // if (item.data!.isEmpty) {
                //   songs = item.data!;
                //   // return const Center(
                //   //   child: Text("No Songs Found"),
                //   // );
                // }

                //showing the songs
                //
                //
                // songs.clear();
                //
                //
                songs = item.data ?? [];
                //add songs to the song list

                return Center(
                  child: TweenAnimationBuilder<double>(
                    onEnd: (() => requestStoragePermission(
                          context,
                        )),
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: const Duration(seconds: 1),
                    builder: ((context, value, child) {
                      return Transform.rotate(
                        angle: 0,
                        child: Image.asset(
                          "assets/image/musique.png",
                          scale: 3,
                        ),
                      );
                    }),
                  ),
                );
              }),
        ),
      ),
    );
  }

  void navigateHome(BuildContext context) async {
    if (!mounted) {
      return;
    }
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const BottomTabControllerScreen(),
      ),
    );
  }

  void requestStoragePermission(BuildContext context) async {
    //only if the platform is not web, coz web have no permissions
    if (!kIsWeb) {
      bool permissionStatus = await _audioQuery.permissionsStatus();
      if (!permissionStatus) {
        await _audioQuery.permissionsRequest();
        // navigateHome(context);
      } else {
        autorisationAcces = true;
        if (!!mounted) {}
        navigateHome(context);
      }
      navigateHome(context);

      //ensure build method is called
      setState(() {});
    }
  }
}
