import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:party_organizer/models/party.dart';
import 'package:party_organizer/screens/party_details.dart';

class PartyListItem extends StatelessWidget {
  const PartyListItem(
      {super.key,
      required this.party,
      required this.image,
      required this.onToggleFavorite});

  final Party party;
  final Image image;
  final void Function(Party party) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: MediaQuery.sizeOf(context).width,
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            child: Column(
              children: [
                Text(
                  party.date.split(' ')[0],
                  style: const TextStyle(
                      fontSize: 24,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  (party.date.split(' ').length > 1)
                      ? party.date.split(' ')[1]
                      : '',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageTransition(
                  child: PartyDetails(
                    party: party,
                    onToggleFavorite: onToggleFavorite,
                  ),
                  type: PageTransitionType.fade,
                ),
              );
            },
            child: Container(
              height: 170,
              width: MediaQuery.sizeOf(context).width - 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(party.imagePath, scale: 1.0),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black54.withOpacity(0.7),
                      Colors.black54.withOpacity(0.4),
                      Colors.black54.withOpacity(0.3),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        party.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            party.startTime,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
