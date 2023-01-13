import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

List<SongModel> songs = [];

List favoriteList = [];
List playList = [];
List recentList = [];
List albumList = [];
List<SongModel> LocalsearchResult = [];

final AudioPlayer globalPhonePlayer = AudioPlayer();

int containerIndex = 1;
bool autorisationAcces = false;
