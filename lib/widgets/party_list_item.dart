import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:party_organizer/models/party.dart';
import 'package:party_organizer/screens/party_details.dart';

class PartyListItem extends StatelessWidget {
  const PartyListItem({super.key, required this.party, required this.image});

  final Party party;
  final AssetImage image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: MediaQuery.sizeOf(context).width,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(border: Border.all()),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: Column(
              children: [
                const Text(
                  'dan',
                  style: TextStyle(fontSize: 24),
                ),
                const Text(
                  'mjesec',
                  style: TextStyle(fontSize: 24),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Container(
            height: 170,
            width: 250,
            decoration: BoxDecoration(
              image: DecorationImage(image: image, fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }
}
