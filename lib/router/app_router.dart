import 'package:flutter/material.dart';
import 'package:xchat/animation/fetch_storage_animation.dart';
import 'package:xchat/screens/main%20screen/chat_home_screen.dart';
import 'package:xchat/screens/main%20screen/home_screen.dart';
import 'package:xchat/screens/music%20screen/album.dart';
import 'package:xchat/screens/music%20screen/artist.dart';
import 'package:xchat/screens/music%20screen/folder.dart';
import 'package:xchat/screens/main%20screen/profil_screen.dart';
import 'package:xchat/screens/main%20screen/search_screen.dart';
import 'package:xchat/screens/main%20screen/videos_screen.dart';
import 'package:xchat/screens/music%20screen/storage_songs_screen.dart';
import 'package:xchat/screens/screen%20tab%20controller/top_tab_screen_controller.dart';
import 'package:xchat/screens/sub%20screen/favorites_screen.dart';
import 'package:xchat/screens/sub%20screen/playlist_screen.dart';
import 'package:xchat/screens/sub%20screen/recent_screen.dart';
import 'package:xchat/screens/waiting_access_screen.dart';

import '../screens/music screen/local_search_screen.dart';

class Approuter {
  Route onGneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case MyHomeScreen.routeName:
        return MaterialPageRoute(
          builder: ((context) => const MyHomeScreen()),
        );
      //
      //music tabbar screen
      case AlbumScreen.routeName:
        return MaterialPageRoute(
          builder: ((context) => const AlbumScreen()),
        );
      case ArtistScreen.routeName:
        return MaterialPageRoute(
          builder: ((context) => const ArtistScreen()),
        );
      case FolderScreen.routeName:
        return MaterialPageRoute(
          builder: ((context) => const FolderScreen()),
        );
      case StorageSongsScreen.routeName:
        return MaterialPageRoute(
          builder: ((context) => const StorageSongsScreen()),
        );
      case FetchStorageAnimation.routeName:
        return MaterialPageRoute(
          builder: ((context) => const FetchStorageAnimation()),
        );
      case TopTabControllerScreen.routeName:
        return MaterialPageRoute(
          builder: ((context) => const TopTabControllerScreen()),
        );
      case WaitingAutorisationScreen.routeName:
        return MaterialPageRoute(
          builder: ((context) => const WaitingAutorisationScreen()),
        );

      //
      // sub screen
      case FavoritesScreen.routeName:
        return MaterialPageRoute(
          builder: ((context) => const FavoritesScreen()),
        );
      case PlaylistScreen.routeName:
        return MaterialPageRoute(
          builder: ((context) => const PlaylistScreen()),
        );
      case RecentScreen.routeName:
        return MaterialPageRoute(
          builder: ((context) => const RecentScreen()),
        );

      case ChathomeScreen.routeName:
        return MaterialPageRoute(
          builder: ((context) => const ChathomeScreen()),
        );
      case ProfilScreen.routeName:
        return MaterialPageRoute(
          builder: ((context) => const ProfilScreen()),
        );
      case SearchScreen.routeName:
        return MaterialPageRoute(
          builder: ((context) => const SearchScreen()),
        );
      case VideoScreen.routeName:
        return MaterialPageRoute(
          builder: ((context) => const VideoScreen()),
        );

      case LocalSearchSceen.routeName:
        return MaterialPageRoute(
          builder: ((context) => const LocalSearchSceen()),
        );
      default:
        return MaterialPageRoute(
          builder: ((context) => const MyHomeScreen()),
        );
    }
  }
}
