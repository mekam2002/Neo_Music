import 'package:flutter/material.dart';
import 'package:xchat/screens/music%20screen/album.dart';
import 'package:xchat/screens/music%20screen/artist.dart';
import 'package:xchat/screens/music%20screen/folder.dart';

import '../music screen/storage_songs_screen.dart';

class TopTabControllerScreen extends StatefulWidget {
  const TopTabControllerScreen({super.key});
  static const routeName = "/TopTabControllerScreen_screen";

  @override
  State<TopTabControllerScreen> createState() => _TopTabControllerScreenState();
}

class _TopTabControllerScreenState extends State<TopTabControllerScreen>
    with AutomaticKeepAliveClientMixin<TopTabControllerScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
        body: Column(
          children: [
            Theme(
              data: ThemeData(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  color: Colors.green[300],
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(
                    text: 'Songs',
                  ),
                  Tab(
                    text: 'Artist',
                  ),
                  Tab(
                    text: 'Albums',
                  ),
                  Tab(
                    text: 'Folders',
                  )
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  StorageSongsScreen(),
                  ArtistScreen(),
                  AlbumScreen(),
                  FolderScreen()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
