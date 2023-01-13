import 'package:flutter/material.dart';

class ChathomeScreen extends StatefulWidget {
  const ChathomeScreen({super.key});
  static const routeName = "/ChatHome_screen";

  @override
  State<ChathomeScreen> createState() => _ChathomeScreenState();
}

class _ChathomeScreenState extends State<ChathomeScreen>
    with AutomaticKeepAliveClientMixin<ChathomeScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 39, 39, 39),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
        elevation: 0.1,
        title: const Center(
          child: Text(
            "Chat",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // openBrowser();
          },
          child: const Text(
            "open Browser",
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
