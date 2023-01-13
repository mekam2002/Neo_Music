import 'package:flutter/material.dart';
// ignore: unused_import

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static const routeName = "/Search_screen";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with AutomaticKeepAliveClientMixin<SearchScreen> {
  String? message;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 39, 39, 39),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
        elevation: 0.1,
        title: const Text(
          "Search",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
