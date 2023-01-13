import 'package:flutter/material.dart';

class MoreCard extends StatelessWidget {
  const MoreCard({
    super.key,
    required this.cardTitle,
    required this.cardColor,
    required this.cardColor2,
    required this.cardIcon,
  });

  final String cardTitle;
  final Color cardColor;
  final Color cardColor2;
  final IconData cardIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [cardColor2, cardColor],
        ),
        color: cardColor,
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(cardIcon),
            Text(
              cardTitle,
            ),
          ],
        ),
      ),
    );
  }
}
