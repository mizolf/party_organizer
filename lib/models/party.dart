enum MusicType {
  Rock,
  HipHop,
  Techno,
  Balkan,
  Jazz,
}

class Party {
  const Party({
    required this.title,
    required this.startTime,
    required this.musicType,
    required this.isAlcNeeded,
  });
  final String title;
  final DateTime startTime;
  final List<MusicType> musicType;
  final bool isAlcNeeded;
}
