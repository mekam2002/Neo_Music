import 'package:flutter/material.dart';

class MusicCard extends StatelessWidget {
  const MusicCard({
    super.key,
    required this.userStorageMusicImageUrl,
    required this.userStorageMusicName,
    required this.userStrorageMusicArtistName,
  });
  final String userStorageMusicImageUrl;
  final String userStorageMusicName;
  final String userStrorageMusicArtistName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(
            Icons.speaker,
          ),
          // Image.network(
          //   userStorageMusicImageUrl,
          //   fit: BoxFit.cover,
          // ),
          title: Text(
            userStorageMusicName,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            userStrorageMusicArtistName,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_sharp,
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
