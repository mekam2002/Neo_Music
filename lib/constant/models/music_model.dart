class MusicModel {
  MusicModel({
    required this.album,
    required this.id,
    required this.albumId,
    required this.artist,
    required this.artistId,
    required this.bookmark,
    required this.composer,
    required this.data,
    required this.dateAdded,
    required this.dateModified,
    required this.displayName,
    required this.displayNameWOExt,
    required this.duration,
    required this.fileExtension,
    required this.genre,
    required this.genreId,
    required this.getMap,
    required this.isAlarm,
    required this.isAudioBook,
    required this.isMusic,
    required this.isNotification,
    required this.isPodcast,
    required this.isRingtone,
    required this.size,
    required this.title,
    required this.track,
    required this.uri,
    required this.hasRecentlyPlayed,
    required this.isFavorite,
    required this.playnumber,
  });
  int id;

  /// Return song [data]
  String data;

  /// Return song [uri]
  String? uri;

  /// Return song [displayName]
  String displayName;

  /// Return song [displayName] without Extension
  String displayNameWOExt;

  /// Return song [size]
  int size;

  /// Return song [album]
  String? album;

  /// Return song [albumId]
  int? albumId;

  /// Return song [artist]
  String? artist;

  /// Return song [artistId]
  int? artistId;

  /// Return song [genre]
  ///
  /// Important:
  ///   * Only Api >= 30/Android 11
  String? genre;

  /// Return song [genreId]
  ///
  /// Important:
  ///   * Only Api >= 30/Android 11
  int? genreId;

  /// Return song [bookmark]
  int? bookmark;

  /// Return song [composer]
  String? composer;

  /// Return song [dateAdded]
  int? dateAdded;

  /// Return song [dateModified]
  int? dateModified;

  /// Return song [duration]
  int? duration;

  /// Return song [title]
  String title;

  /// Return song [track]
  int? track;

  // /// Return song [uri]
  // String get uri;

  /// Return song only the [fileExtension]
  String fileExtension;

  // Bool methods

  /// Return song type: [isAlarm]
  ///
  /// Will always return true or false
  bool? isAlarm;

  /// Return song type: [isAudioBook]
  ///
  /// Will always return true or false
  ///
  /// Important:
  ///   * Only Api >= 29/Android 10
  bool? isAudioBook;

  /// Return song type: [isMusic]
  ///
  /// Will always return true or false
  bool? isMusic;

  /// Return song type: [isNotification]
  ///
  /// Will always return true or false
  bool? isNotification;

  /// Return song type: [isPodcast]
  ///
  /// Will always return true or false
  bool? isPodcast;

  /// Return song type: [isRingtone]
  ///
  /// Will always return true or false
  bool? isRingtone;

  /// Return a map with all [keys] and [values] from specific song.
  Map getMap;
  bool isFavorite;
  bool hasRecentlyPlayed;
  int playnumber;
}
