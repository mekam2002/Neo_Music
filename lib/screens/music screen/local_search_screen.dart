import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../constant/music_list.dart';
import '../../repositories/create_player.dart';

class LocalSearchSceen extends StatefulWidget {
  const LocalSearchSceen({super.key});
  static const routeName = "/LocalSearch_screen";

  @override
  State<LocalSearchSceen> createState() => _LocalSearchSceenState();
}

class _LocalSearchSceenState extends State<LocalSearchSceen>
    with AutomaticKeepAliveClientMixin<LocalSearchSceen> {
  FocusNode _focus = FocusNode();

  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    LocalsearchResult = songs;
    super.initState();
  }

  void searchInLocalStorage(String textQuerry) {
    List<SongModel> _result = [];
    if (textQuerry.isEmpty) {
      return;
    } else {
      _result = songs
          .where((element) =>
              element.title.toLowerCase().contains(textQuerry.toLowerCase()))
          .toList();
      setState(() {
        LocalsearchResult = _result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              height: 40,
              // margin: EdgeInsets.symmetric(
              //   horizontal: 20,
              // ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              child: TextField(
                controller: _controller,
                focusNode: _focus,
                onChanged: (value) => searchInLocalStorage(
                  _controller.text,
                ),
                decoration: InputDecoration(
                  // labelText: "Search",
                  prefixText: "Search",
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: ListView.builder(
                itemCount: LocalsearchResult.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(
                        top: 15.0, left: 12.0, right: 16.0),
                    child: ListTile(
                      textColor: Colors.white,
                      title: Text(
                        LocalsearchResult[index].title.toLowerCase(),
                        maxLines: 1,
                      ),
                      subtitle: Text(
                        LocalsearchResult[index].displayName.split("-")[0],
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.white60,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert,
                          color: Colors.white60,
                        ),
                      ),
                      leading: QueryArtworkWidget(
                        id: LocalsearchResult[index].id,
                        type: ArtworkType.AUDIO,
                      ),
                      onTap: () async {
                        // bottomMusic.addItem(
                        //   userMusic[index].id,
                        //   userMusic[index].title,
                        //   index,
                        // );
                        if (globalPhonePlayer.playing) {
                          await globalPhonePlayer.play();
                        }
                        await globalPhonePlayer.setAudioSource(
                            createPlaylist(LocalsearchResult),
                            initialIndex: index);
                        await globalPhonePlayer.play();
                        setState(() {
                          containerIndex = index;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
