import 'package:flutter/material.dart';
import 'package:xchat/screens/main%20screen/home_screen.dart';
import 'package:xchat/screens/main%20screen/profil_screen.dart';
import 'package:xchat/screens/main%20screen/search_screen.dart';

import '../../constant/music_list.dart';
import '../../repositories/modalsheet.dart';
import '../sub screen/global_snackbar.dart';

class BottomTabControllerScreen extends StatefulWidget {
  const BottomTabControllerScreen({super.key});
  static const routeName = "/First_screen";

  @override
  State<BottomTabControllerScreen> createState() =>
      _BottomTabControllerScreenState();
}

class _BottomTabControllerScreenState extends State<BottomTabControllerScreen>
    with AutomaticKeepAliveClientMixin<BottomTabControllerScreen> {
  final List<Widget> screenList = [
    const MyHomeScreen(),
    const SearchScreen(),
    const ProfilScreen(),
  ];
  int indexSelectedScreen = 0;

  void selectScreen(int index) {
    setState(() {
      indexSelectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body:
          //
          //
          // ou l'erruer growable array se produit

          Column(
        children: [
          Flexible(
            child: IndexedStack(
              index: indexSelectedScreen,
              children: screenList,
            ),
          ),
          // Flexible(
          //   child: screenList[indexSelectedScreen],
          // ),
          autorisationAcces && globalPhonePlayer.playing
              ? GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: ((context) => const BottomMusicPlayerSheet()),
                    );
                  },
                  child: Dismissible(
                    onDismissed: (direction) {
                      globalPhonePlayer.stop();
                    },
                    background: Container(
                      alignment: Alignment.centerRight,
                      color: Colors.white,
                      child: const Icon(
                        Icons.stop_circle,
                        size: 40,
                      ),
                    ),
                    direction: DismissDirection.endToStart,
                    key: const Key(
                      "value123",
                    ),
                    child: const GlobalSnackBarPlayer(),
                  ),
                )
              : Container(),
        ],
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          canvasColor: Theme.of(context).canvasColor,
        ),
        child: BottomNavigationBar(
          showUnselectedLabels: false,
          showSelectedLabels: false,
          onTap: selectScreen,
          // backgroundColor: const Color.fromARGB(255, 39, 39, 39),
          unselectedItemColor: Theme.of(context).colorScheme.secondary,
          selectedItemColor: Colors.amber,
          currentIndex: indexSelectedScreen,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.music_note_outlined,
                color: indexSelectedScreen == 0 ? Colors.amber : Colors.grey,
                size: 30,
              ),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(
                Icons.search_rounded,
                color: indexSelectedScreen == 1 ? Colors.amber : Colors.grey,
                size: 30,
              ),
            ),
            BottomNavigationBarItem(
              label: "Profil",
              icon: Icon(
                Icons.account_circle,
                color: indexSelectedScreen == 2 ? Colors.amber : Colors.grey,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
