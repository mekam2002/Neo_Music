import 'package:flutter/material.dart';
import 'package:xchat/screens/screen%20tab%20controller/top_tab_screen_controller.dart';
import 'package:xchat/screens/sub%20screen/favorites_screen.dart';
import 'package:xchat/screens/sub%20screen/playlist_screen.dart';
import 'package:xchat/screens/sub%20screen/recent_screen.dart';
import 'package:xchat/widgets/more_card.dart';

import '../music screen/local_search_screen.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});
  static const routeName = "/Home_screen";

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen>
    with AutomaticKeepAliveClientMixin<MyHomeScreen> {
  @override
  bool get wantKeepAlive => true;

  TextEditingController _controller = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 39, 39, 39),
      // appBar: AppBar(
      //   backgroundColor: const Color.fromARGB(255, 39, 39, 39),
      //   elevation: 0.1,
      //   title: const Text(
      //     "Neo music",
      //     style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //       color: Colors.black,
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () => Navigator.of(context).pushNamed(
      //         LocalSearchSceen.routeName,
      //       ),
      //       icon: Icon(
      //         Icons.search,
      //       ),
      //     )
      //   ],
      // ),
      body: Column(
        children: [
          const SizedBox(
            height: 55,
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(
              LocalSearchSceen.routeName,
            ),
            child: Container(
              alignment: Alignment.centerLeft,
              width: 350,
              height: 35,
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color.fromARGB(255, 95, 93, 93),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.search),
                      Text("Search"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.horizontal_rule_sharp),
                      Icon(Icons.keyboard_voice),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(
                  FavoritesScreen.routeName,
                ),
                child: const MoreCard(
                  cardColor: Color.fromARGB(255, 236, 99, 89),
                  cardTitle: 'Favorite',
                  cardColor2: Color.fromARGB(255, 241, 19, 3),
                  cardIcon: Icons.favorite,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(
                  PlaylistScreen.routeName,
                ),
                child: const MoreCard(
                  cardColor: Color.fromARGB(255, 113, 186, 245),
                  cardTitle: 'PlayList',
                  cardColor2: Color.fromARGB(255, 24, 144, 241),
                  cardIcon: Icons.multitrack_audio_sharp,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(
                  RecentScreen.routeName,
                ),
                child: const MoreCard(
                  cardColor: Color.fromARGB(255, 117, 216, 120),
                  cardTitle: 'Recent',
                  cardColor2: Color.fromARGB(255, 62, 238, 68),
                  cardIcon: Icons.timelapse,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Expanded(
            child: TopTabControllerScreen(),
          ),
        ],
      ),
    );
  }
}
