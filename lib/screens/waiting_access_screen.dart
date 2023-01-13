import 'package:flutter/material.dart';

class WaitingAutorisationScreen extends StatelessWidget {
  const WaitingAutorisationScreen({super.key});
  static const routeName = "/WaitingAutorisation_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: const Center(
        child: Text(
          "veuillez autorisez l'application a acceder a votre stockage",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
