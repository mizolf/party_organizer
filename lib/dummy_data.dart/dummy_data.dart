import 'package:party_organizer/models/party.dart';

final parties = [
  Party(
    title: 'Pivo Party',
    startTime: DateTime(2024, 1, 21, 20, 00),
    musicType: [
      MusicType.Balkan,
    ],
    isAlcNeeded: true,
  ),
  Party(
    title: 'Nogometni kviz',
    startTime: DateTime(2024, 2, 1, 19, 00),
    musicType: [
      MusicType.Balkan,
      MusicType.Rock,
      MusicType.HipHop,
    ],
    isAlcNeeded: false,
  ),
  Party(
    title: 'Dnevni party',
    startTime: DateTime(2024, 7, 7, 14, 00),
    musicType: [
      MusicType.Balkan,
      MusicType.Rock,
      MusicType.HipHop,
      MusicType.Techno,
    ],
    isAlcNeeded: true,
  ),
  Party(
    title: 'Godisnjica mature',
    startTime: DateTime(2024, 10, 10, 19, 00),
    musicType: [
      MusicType.Balkan,
      MusicType.Rock,
    ],
    isAlcNeeded: false,
  ),
];
