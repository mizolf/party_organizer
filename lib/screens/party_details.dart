import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:party_organizer/models/party.dart';
import 'package:party_organizer/widgets/grid_alc_details.dart';
import 'package:party_organizer/widgets/grid_costume_details.dart';
import 'package:party_organizer/widgets/grid_music_details.dart';
import 'package:party_organizer/widgets/grid_time_details.dart';

class PartyDetails extends StatelessWidget {
  const PartyDetails(
      {super.key, required this.party, required this.onToggleFavorite});

  final Party party;
  final void Function(Party party) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(party.title),
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavorite(party);
            },
            icon: const Icon(Icons.star_border_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              FadeIn(
                duration: const Duration(milliseconds: 1000),
                child: Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(blurRadius: 5.0, offset: Offset(2, 3)),
                    ],
                    image: const DecorationImage(
                      image: AssetImage('assets/images/home.jpeg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.sizeOf(context).height - 360,
                margin: const EdgeInsets.only(
                  top: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    children: [
                      FadeInLeft(
                          duration: const Duration(milliseconds: 1500),
                          child: GridTimeDetails(
                              time: party.startTime, date: party.date)),
                      FadeInDown(
                          duration: const Duration(milliseconds: 1500),
                          child: GridAlcDetails(alc: party.isAlcNeeded)),
                      FadeInUp(
                          duration: const Duration(milliseconds: 1500),
                          child: GridMusicDetails(music: party.musicType)),
                      FadeInRight(
                        duration: const Duration(milliseconds: 1500),
                        child: GridCostumeDetails(
                          costume: party.costume,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
