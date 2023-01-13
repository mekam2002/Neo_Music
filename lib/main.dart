// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:xchat/animation/fetch_storage_animation.dart';
import 'package:xchat/providers/botton_item.dart';
import 'package:xchat/providers/storage_songs_provider.dart';
import 'package:xchat/router/app_router.dart';
import 'package:xchat/screens/screen%20tab%20controller/bottom_tab_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  Approuter approuter = Approuter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => StorageSongsProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => BottomSceenProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Neo Music',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          canvasColor: const Color.fromARGB(255, 34, 33, 33),
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
          ).copyWith(secondary: Colors.black),
        ),
        home: const FetchStorageAnimation(),
        onUnknownRoute: ((settings) {
          const BottomTabControllerScreen();
        }),
        onGenerateRoute: approuter.onGneratedRoute,
      ),
    );
    // );
  }
}
