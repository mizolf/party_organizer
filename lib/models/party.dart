class Party {
  const Party(
      {required this.title,
      required this.startTime,
      required this.musicType,
      required this.isAlcNeeded,
      required this.costume,
      required this.date,
      required this.imagePath});
  final String title;
  final String startTime;
  final String date;
  final List<String> musicType;
  final bool isAlcNeeded;
  final String costume;
  final String imagePath;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'startTime': startTime,
      'date': date,
      'musicType': musicType,
      'isAlcNeeded': isAlcNeeded,
      'costume': costume,
      'imagePath': imagePath,
    };
  }

  factory Party.fromMap(Map<String, dynamic> map) {
    return Party(
      title: map['title'] ?? '',
      startTime: map['startTime'] ?? '',
      date: map['date'] ?? '',
      musicType: List<String>.from(map['musicType'] ?? []),
      isAlcNeeded: map['isAlcNeeded'] ?? false,
      costume: map['costume'] ?? '',
      imagePath: map['imagePath'] ?? '',
    );
  }
}
