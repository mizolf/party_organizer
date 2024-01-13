enum MusicType {
  Rock,
  HipHop,
  Techno,
  Balkan,
  Jazz,
}

class Party {
  const Party(
      {required this.title,
      required this.startTime,
      required this.musicType,
      required this.isAlcNeeded,
      required this.costume});
  final String title;
  final DateTime startTime;
  final List<MusicType> musicType;
  final bool isAlcNeeded;
  final String costume;
}
